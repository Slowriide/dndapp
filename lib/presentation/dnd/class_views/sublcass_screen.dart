import 'package:dnd_app/common/utils/brackets_remover.dart';
import 'package:dnd_app/common/widgets/widgets.dart';
import 'package:dnd_app/presentation/providers/dnd_provders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubclassScreen extends ConsumerWidget {
  final String subclassUrl;

  const SubclassScreen({super.key, required this.subclassUrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = Theme.of(context).textTheme;

    final subclassAsync = ref.watch(subclassProvider(subclassUrl));

    return Scaffold(
      appBar: AppBar(
        title: subclassAsync.when(
          loading: () => const Text("Loading..."),
          error: (error, stack) => const Text("Error"),
          data: (subclass) => Text(
              '${subclass.subclassFlavor} of ${subclass.name} ',
              style: textStyles.bodyLarge),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.bookmark_border_sharp,
                size: 30,
                color: Colors.amber[800],
              ),
            ),
          ),
        ],
      ),
      body: subclassAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text("Error: $error")),
        data: (subclass) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MySizedBox(),
                  Text(
                    removeSquareBrackets(subclass.desc?.first ?? ''),
                    style: textStyles.bodyMedium,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MySizedBox(),
                      _buildLevels(subclass.index ?? '', ref),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _buildLevels(String id, WidgetRef ref) {
  final levelsAsync = ref.watch(subclassLevelsProvider(id));

  return levelsAsync.when(
    loading: () => const CircularProgressIndicator(),
    error: (error, stack) => const Text("Error al cargar los niveles"),
    data: (levels) {
      return Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: levels.length,
            itemBuilder: (context, index) {
              final textStyles = Theme.of(context).textTheme;
              final level = levels[index];
              final featureUrls = level.features!.map((f) => f.index).toList();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MySizedBox(),
                  Text(
                    "Level ${level.level}",
                    style: textStyles.bodyLarge!
                        .copyWith(color: Colors.amber[800]),
                  ),
                  const MySizedBox(),
                  _buildFeatures(featureUrls, ref, context),
                ],
              );
            },
          ),
          const MySizedBox(height: 30),
          const BasicRulesMark()
        ],
      );
    },
  );
}

Widget _buildFeatures(
    List<String?> featureIds, WidgetRef ref, BuildContext context) {
  final textStyles = Theme.of(context).textTheme;
  return Column(
    children: featureIds.map((featureId) {
      if (featureId == null) return const SizedBox();

      final featuresAsync = ref.watch(subclassFeaturesProvider(featureId));

      return featuresAsync.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stack) => Text("Error: $error"),
        data: (features) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: features
              .map(
                (feature) => ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(feature.name ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const MySizedBox(),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        feature.desc?.join("\n") ?? '',
                        style: textStyles.bodySmall,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      );
    }).toList(),
  );
}
