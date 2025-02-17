import 'package:animate_do/animate_do.dart';
import 'package:dnd_app/common/widgets/list_tiles/equipment_list_tile.dart';
import 'package:dnd_app/common/widgets/list_tiles/magic_item_list_tile.dart';
import 'package:dnd_app/common/widgets/list_tiles/spell_list_tile.dart';
import 'package:dnd_app/common/widgets/widgets.dart';

import 'package:dnd_app/domain/entities/dnd/generics/generic_entities.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/equipment.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/magic_item.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/spell.dart';
import 'package:dnd_app/presentation/providers/equipment_provider.dart';
import 'package:dnd_app/presentation/providers/filter_provider/filder_data_provider.dart';
import 'package:dnd_app/presentation/providers/magicitem_provider.dart';
import 'package:dnd_app/presentation/providers/monster_provider.dart';
import 'package:dnd_app/presentation/providers/spell_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ListingView extends ConsumerWidget {
  const ListingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(categoryDataProvider);

    final Color? lightRed = Colors.red[300];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 5, bottom: 15, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: CustomSearchbox(hint: 'Search'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.filter_list_rounded,
                        color: lightRed,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          data.when(
            //CARGANDO
            loading: () => const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),

            //ERROR
            error: (error, stackTrace) => SliverToBoxAdapter(
              child: Center(
                child: Text('Error: $error'),
              ),
            ),

            //ITEMS EMPTY
            data: (items) {
              if (items.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text('No items found'),
                  ),
                );
              }

              //TENGO DATA
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = items[index];

                    //MONSTRUOS
                    if (item is Monsters) {
                      final monsterId =
                          item.url.replaceAll('/api/monsters/', '');

                      ref
                          .read(monsterInfoProvider.notifier)
                          .loadMonster(monsterId);

                      final Monster? monster =
                          ref.watch(monsterInfoProvider)[monsterId];
                      if (monster == null) {
                        return const Text('no monster');
                      }
                      return GestureDetector(
                        onTap: () => context.push('/home/0/monster/$monsterId'),
                        child: FadeInRight(
                          child: ListTile(
                            title: Text(item.name),
                          ),
                        ),
                      );

                      // return FadeInRight(
                      //   child: GestureDetector(
                      //     onTap: () =>
                      //         context.push('/home/0/monster/$monsterId'),
                      //     child: MonsterListTile(
                      //       name: item.name,
                      //       monster: monster,
                      //     ),
                      //   ),
                      // );

                      //MAGIC ITEMS
                    } else if (item is MagicItems) {
                      final magicitemId =
                          item.url.replaceAll('/api/magic-items/', '');
                      ref
                          .read(magicItemInfoProvider.notifier)
                          .loadMagicItem(magicitemId);

                      final MagicItem? magicitem =
                          ref.watch(magicItemInfoProvider)[magicitemId];
                      if (magicitem == null) {
                        return const Text('no item');
                      }

                      return FadeInRight(
                        child: GestureDetector(
                          onTap: () =>
                              context.push('/home/0/magic-items/$magicitemId'),
                          child: MagicItemListTile(
                            name: item.name,
                            magicItem: magicitem,
                          ),
                        ),
                      );

                      //EQUIPMENT
                    } else if (item is EquipmentGeneric) {
                      final equipmentId =
                          item.url.replaceAll('/api/equipment/', '');
                      ref
                          .read(equipmentInfoProvider.notifier)
                          .loadEquipment(equipmentId);
                      final Equipment? equipment =
                          ref.watch(equipmentInfoProvider)[equipmentId];

                      return FadeInRight(
                        child: GestureDetector(
                          onTap: () =>
                              context.push('/home/0/equipment/$equipmentId'),
                          child: EquipmentListTile(
                            name: item.name,
                            equipment: equipment,
                          ),
                        ),
                      );

                      //CLASSES
                    } else if (item is Classes) {
                      final classId = item.url.replaceAll('/api/classes/', '');
                      return GestureDetector(
                        onTap: () => context.push('/home/0/classes/$classId'),
                        child: FadeInRight(
                          child: ListTile(
                            title: Text(item.name),
                          ),
                        ),
                      );

                      //RACES
                    } else if (item is Races) {
                      final raceId = item.url.replaceAll('/api/races/', '');
                      return GestureDetector(
                        onTap: () => context.push('/home/0/races/$raceId'),
                        child: FadeInRight(
                          child: ListTile(
                            title: Text(item.name),
                          ),
                        ),
                      );

                      //SPELLS
                    } else if (item is Spells) {
                      final spellId = item.url.replaceAll('/api/spells/', '');
                      ref.read(spellInfoProvider.notifier).loadSpell(spellId);

                      final Spell? spell =
                          ref.watch(spellInfoProvider)[spellId];

                      return GestureDetector(
                        onTap: () => context.push('/home/0/spells/$spellId'),
                        child: FadeInRight(
                          child: SpellListTile(
                            name: item.name,
                            spell: spell,
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                  childCount: items.length,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
