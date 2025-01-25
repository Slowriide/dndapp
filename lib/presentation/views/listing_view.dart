import 'package:animate_do/animate_do.dart';
import 'package:dnd_app/common/widgets/widgets.dart';

import 'package:dnd_app/domain/entities/dnd/classes.dart';
import 'package:dnd_app/domain/entities/dnd/magic_items.dart';
import 'package:dnd_app/domain/entities/dnd/monsters.dart';
import 'package:dnd_app/presentation/providers/filter_provider/filder_data_provider.dart';
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
            loading: () => const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, stackTrace) => SliverToBoxAdapter(
              child: Center(
                child: Text('Error: $error'),
              ),
            ),
            data: (items) {
              if (items.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text('No items found'),
                  ),
                );
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = items[index];

                    if (item is Monsters) {
                      final monsterId =
                          item.url.replaceAll('/api/monsters/', '');
                      return FadeInRight(
                        child: GestureDetector(
                          onTap: () =>
                              context.push('/home/0/monster/$monsterId'),
                          child: MonsterListTile(
                            name: item.name,
                          ),
                        ),
                      );
                    } else if (item is MagicItems) {
                      return FadeInRight(
                        child: ListTile(
                          title: Text(item.name),
                        ),
                      );
                    } else if (item is Classes) {
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
