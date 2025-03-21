import 'package:animate_do/animate_do.dart';
import 'package:dnd_app/common/widgets/list_tiles/class_list_tile.dart';
import 'package:dnd_app/common/widgets/list_tiles/equipment_list_tile.dart';
import 'package:dnd_app/common/widgets/list_tiles/magic_item_list_tile.dart';
import 'package:dnd_app/common/widgets/list_tiles/monster_list_tile.dart';
import 'package:dnd_app/common/widgets/list_tiles/race_list_tile.dart';
import 'package:dnd_app/common/widgets/list_tiles/spell_list_tile.dart';
import 'package:dnd_app/domain/entities/dnd/generics/generic_entities.dart';
import 'package:dnd_app/presentation/providers/class_provider.dart';
import 'package:dnd_app/presentation/providers/equipment_provider.dart';
import 'package:dnd_app/presentation/providers/filter_provider/general_filter_provider.dart';
import 'package:dnd_app/presentation/providers/magicitem_provider.dart';
import 'package:dnd_app/presentation/providers/monster_provider.dart';
import 'package:dnd_app/presentation/providers/race_provider.dart';
import 'package:dnd_app/presentation/providers/spell_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchView extends ConsumerWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = Theme.of(context).textTheme;
    final searchQuery = ref.watch(generalSearchQueryProvider);
    final searchResults = ref.watch(generalSearchProvider);

    return CustomScrollView(
      slivers: [
        ///*
        if (searchQuery.isEmpty)
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 450,
                  width: 450,
                  child: Image.asset('assets/images/3back.png'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Use search to find spells, items, books, monsters and more',
                    style: textStyles.titleSmall,
                  ),
                )
              ],
            ),
          ),

        ///*
        if (searchQuery.isNotEmpty)
          searchResults.when(
            loading: () => const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stackTrace) => SliverToBoxAdapter(
              child: Center(child: Text('Error: $error')),
            ),
            data: (items) {
              if (items.isEmpty) {
                return SliverToBoxAdapter(
                  child: Center(
                      child: Text('No results found for "$searchQuery"')),
                );
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = items[index];
                    // Monstruos
                    if (item is Monsters) {
                      final monsterId =
                          item.url.replaceAll('/api/2014/monsters/', '');
                      ref
                          .read(monsterInfoProvider.notifier)
                          .loadMonster(monsterId);
                      final monster = ref.watch(monsterInfoProvider)[monsterId];
                      if (monster == null) return const Text('no monster');
                      return FadeInRight(
                        child: GestureDetector(
                          onTap: () => context
                              .push('/home/0/api/2014/monsters/$monsterId'),
                          child: MonsterListTile(
                              name: item.name, monster: monster),
                        ),
                      );
                    }
                    // Magic Items
                    else if (item is MagicItems) {
                      final magicitemId =
                          item.url.replaceAll('/api/2014/magic-items/', '');
                      ref
                          .read(magicItemInfoProvider.notifier)
                          .loadMagicItem(magicitemId);
                      final magicitem =
                          ref.watch(magicItemInfoProvider)[magicitemId];
                      if (magicitem == null) return const Text('no item');
                      return FadeInRight(
                        child: GestureDetector(
                          onTap: () => context.push(
                              '/home/0/api/2014/magic-items/$magicitemId'),
                          child: MagicItemListTile(
                              name: item.name, magicItem: magicitem),
                        ),
                      );
                    }
                    // Equipment
                    else if (item is EquipmentGeneric) {
                      final equipmentId =
                          item.url.replaceAll('/api/2014/equipment/', '');
                      ref
                          .read(equipmentInfoProvider.notifier)
                          .loadEquipment(equipmentId);
                      final equipment =
                          ref.watch(equipmentInfoProvider)[equipmentId];
                      return FadeInRight(
                        child: GestureDetector(
                          onTap: () => context
                              .push('/home/0/api/2014/equipment/$equipmentId'),
                          child: EquipmentListTile(
                              name: item.name, equipment: equipment),
                        ),
                      );
                    }
                    // Classes
                    else if (item is Classes) {
                      final classId =
                          item.url.replaceAll('/api/2014/classes/', '');
                      ref.read(classInfoProvider.notifier).loadClass(classId);
                      final classes = ref.watch(classInfoProvider)[classId];
                      return GestureDetector(
                        onTap: () =>
                            context.push('/home/0/api/2014/classes/$classId'),
                        child: FadeInRight(
                          child: ClassListTile(classes: classes),
                        ),
                      );
                    }
                    // Races
                    else if (item is Races) {
                      final raceId =
                          item.url.replaceAll('/api/2014/races/', '');
                      ref.read(raceInfoProvider.notifier).loadRace(raceId);
                      final race = ref.watch(raceInfoProvider)[raceId];
                      return GestureDetector(
                        onTap: () =>
                            context.push('/home/0/api/2014/races/$raceId'),
                        child: FadeInRight(
                          child: RaceListTile(race: race),
                        ),
                      );
                    }
                    // Spells
                    else if (item is Spells) {
                      final spellId =
                          item.url.replaceAll('/api/2014/spells/', '');
                      ref.read(spellInfoProvider.notifier).loadSpell(spellId);
                      final spell = ref.watch(spellInfoProvider)[spellId];
                      return GestureDetector(
                        onTap: () =>
                            context.push('/home/0/api/2014/spells/$spellId'),
                        child: FadeInRight(
                          child: SpellListTile(name: item.name, spell: spell),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                  childCount: items.length,
                ),
              );
            },
          ),
      ],
    );
  }
}
