import 'package:dnd_app/common/widgets/basic_rules_mark.dart';
import 'package:dnd_app/common/widgets/my_sized_box.dart';
import 'package:dnd_app/presentation/providers/dnd_provders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubraceScreen extends ConsumerWidget {
  final String subraceId;
  const SubraceScreen({super.key, required this.subraceId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = Theme.of(context).textTheme;

    final subraceAsync = ref.watch(subraceProvider(subraceId));

    return Scaffold(
      appBar: AppBar(
        title: subraceAsync.when(
          loading: () => const Text("Loading..."),
          error: (error, stack) => const Text("Error"),
          data: (subclass) => Text(
            '${subclass.name}',
            style: textStyles.bodyLarge,
          ),
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
      body: subraceAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
          data: (subrace) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Description
                    Text(
                      subrace.desc ?? '',
                    ),
                    const MySizedBox(height: 30),

                    //ability score
                    Text('Ability Score Increase', style: textStyles.bodyLarge),
                    const MySizedBox(),
                    Text(
                      'Your ${subrace.abilityBonuses?[0].abilityScore.name} score increases by ${subrace.abilityBonuses?[0].bonus} ',
                      style: textStyles.bodySmall,
                    ),

                    //only high elf
                    const MySizedBox(height: 30),
                    subrace.index == 'high-elf'
                        ? _HighElfTraits(textStyles: textStyles)
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: subrace.racialTraits?.length ?? 0,
                            itemBuilder: (context, index) {
                              final trait = subrace.racialTraits![index];

                              return _buildTraits([trait.index], ref, context);
                            },
                          ),
                    const MySizedBox(height: 30),
                    const BasicRulesMark(),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

Widget _buildTraits(
    List<String?> traitId, WidgetRef ref, BuildContext context) {
  final textStyles = Theme.of(context).textTheme;
  return Column(
    children: traitId.map((traitId) {
      if (traitId == null) return const SizedBox();
      final traitsAsync = ref.watch(subraceTraitsProvider(traitId));

      return traitsAsync.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stack) => Text("Error: $error"),
        data: (traits) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: traits
              .map(
                (trait) => ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(trait.name ?? ''),
                      Text(
                        trait.desc!.first,
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

class _HighElfTraits extends StatelessWidget {
  const _HighElfTraits({
    required this.textStyles,
  });

  final TextTheme textStyles;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Weapons
        Text('Elf Weapon Training', style: textStyles.bodyLarge),
        const MySizedBox(),
        Text(
          'You have proficiency with the longsword, shortsword, shortbow, and longbow. ',
          style: textStyles.bodySmall,
        ),
        const MySizedBox(height: 30),

        //Cantrip
        Text('Cantrip', style: textStyles.bodyLarge),
        const MySizedBox(),
        Text(
          'You know one cantrip of your choice from the wizard spell list, Inteligence is your spellcasting ability for it. ',
          style: textStyles.bodySmall,
        ),
        const MySizedBox(height: 30),
        //Extra Lenguage
        Text('Extra Lenguage', style: textStyles.bodyLarge),
        const MySizedBox(),
        Text(
          'You can speak, read, and write one extra lenguage of your choice. ',
          style: textStyles.bodySmall,
        ),
        const MySizedBox(height: 30),
      ],
    );
  }
}
