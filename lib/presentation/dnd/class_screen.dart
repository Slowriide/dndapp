import 'package:dnd_app/domain/entities/dnd/specifics/dnd_class.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/class_levels.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/feature.dart';
import 'package:dnd_app/presentation/dnd/class_views/class_details_view.dart';
import 'package:dnd_app/presentation/dnd/class_views/class_subclass_view.dart';
import 'package:dnd_app/presentation/providers/class_provider.dart';
import 'package:dnd_app/presentation/providers/db/favorite_classes_provider.dart';
import 'package:dnd_app/presentation/providers/db/local_storage_provider.dart';
import 'package:dnd_app/presentation/providers/feature_provider.dart';
import 'package:dnd_app/presentation/providers/levels_per_class_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassScreen extends ConsumerStatefulWidget {
  final String classId;
  const ClassScreen({super.key, required this.classId});

  @override
  ClassScreenState createState() => ClassScreenState();
}

class ClassScreenState extends ConsumerState<ClassScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    ref.read(classInfoProvider.notifier).loadClass(widget.classId);
    ref.read(levelrPerClassInfoProvider.notifier).loadLevels(widget.classId);
    ref.read(featureInfoProvider.notifier).loadFeature(widget.classId);

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    final DndClass? classes = ref.watch(classInfoProvider)[widget.classId];
    final List<LevelPerClass>? levels =
        ref.watch(levelrPerClassInfoProvider)[widget.classId];
    final List<Feature>? features =
        ref.watch(featureInfoProvider)[widget.classId];

    if (classes == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            _AppBar(
              classes: classes,
              textStyles: textStyles,
              theme: theme,
              tabController: _tabController,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            ClassDetailsView(
              selectedclass: classes,
              levels: levels,
              feature: features,
            ),
            ClassSubclassView(selectedclass: classes),
          ],
        ),
      ),
    );
  }
}

final isFavProvider =
    FutureProvider.family.autoDispose((ref, String dndClassId) {
  final classesStorageRepository = ref.watch(classesStorageRepositoryProvider);

  return classesStorageRepository.isClassFavorite(dndClassId);
});

class _AppBar extends ConsumerWidget {
  const _AppBar({
    required this.classes,
    required this.textStyles,
    required this.theme,
    required TabController tabController,
  }) : _tabController = tabController;

  final DndClass? classes;
  final TextTheme textStyles;
  final ColorScheme theme;
  final TabController _tabController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavFuture = ref.watch(isFavProvider(classes!.index!));
    return SliverAppBar(
      expandedHeight: 100,
      floating: false,
      pinned: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      //IMAGE NAME FAV
      title: Row(
        children: [
          //IMAGE
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color.fromARGB(190, 245, 83, 71)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                'assets/images/dndclasses/${classes?.index}.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 5),

          //NAME
          Text('${classes!.name}', style: textStyles.bodyMedium),
          const Spacer(),
          IconButton(
              onPressed: () async {
                // ref
                //     .read(LocalStorageRepositoryProvider)
                //     .toggleFavorite(monster!);
                await ref
                    .read(favoriteDndClassesProvider.notifier)
                    .toggleFavorite(classes!);
                ref.invalidate(isFavProvider(classes!.index!));
              },
              icon: isFavFuture.when(
                loading: () =>
                    const Icon(Icons.bookmark_add_outlined, size: 30),
                error: (_, __) => throw UnimplementedError(),
                data: (isFavorite) => isFavorite
                    ? const Icon(Icons.bookmark_added_rounded, size: 30)
                    : const Icon(Icons.bookmark_add_outlined, size: 30),
              )

              //  const Icon(Icons.bookmark_add_outlined, size: 30),
              ),
        ],
      ),
      bottom: TabBar(
        dividerColor: theme.primary,
        indicatorColor: Colors.amber[800],
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        labelStyle: GoogleFonts.roboto(fontSize: 15),
        indicatorSize: TabBarIndicatorSize.tab,
        controller: _tabController,
        tabs: [
          const Tab(text: 'DETAILS'),
          Tab(text: '${classes!.name} Subclasses'.toUpperCase())
        ],
      ),
    );
  }
}
