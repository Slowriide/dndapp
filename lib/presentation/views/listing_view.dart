import 'package:animate_do/animate_do.dart';
import 'package:dnd_app/common/widgets/widgets.dart';

import 'package:dnd_app/domain/entities/dnd/generics/generic_entities.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';
import 'package:dnd_app/presentation/providers/filter_provider/filder_data_provider.dart';
import 'package:dnd_app/presentation/providers/monster_provider.dart';
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

                      return FadeInRight(
                        child: GestureDetector(
                          onTap: () =>
                              context.push('/home/0/monster/$monsterId'),
                          child: MonsterListTile(
                            name: item.name,
                            monster: monster,
                          ),
                        ),
                      );

                      //MAGIC ITEMS
                    } else if (item is MagicItems) {
                      return FadeInRight(
                        child: ListTile(
                          title: Text(item.name),
                        ),
                      );

                      //CLASSES
                    } else if (item is Classes) {
                      return FadeInRight(
                        child: ListTile(
                          title: Text(item.name),
                        ),
                      );
                    } else if (item is Equipment) {
                      return FadeInRight(
                        child: ListTile(
                          title: Text(item.name),
                        ),
                      );
                    } else if (item is Races) {
                      return FadeInRight(
                        child: ListTile(
                          title: Text(item.name),
                        ),
                      );
                    } else if (item is Spells) {
                      return FadeInRight(
                        child: ListTile(
                          title: Text(item.name),
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
