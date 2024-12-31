import 'package:dnd_app/common/widgets/widgets.dart';

import 'package:dnd_app/domain/entities/dnd/classes.dart';
import 'package:dnd_app/domain/entities/dnd/magic_items.dart';
import 'package:dnd_app/domain/entities/dnd/monsters.dart';

import 'package:dnd_app/presentation/providers/filter_provider/filder_data_provider.dart';
import 'package:dnd_app/presentation/providers/filter_provider/state_filter_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListingView extends ConsumerWidget {
  const ListingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);

    final data = ref.watch(categoryDataProvider);
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: theme.surface,
            surfaceTintColor: theme.surface,
            pinned: true,
            snap: false,
            floating: false,
            automaticallyImplyLeading: false,
            toolbarHeight: 150,
            flexibleSpace: const FlexibleSpaceBar(
              title: CustomAppbar(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: DropdownButton<Category>(
                value: selectedCategory,
                onChanged: (value) {
                  if (value != null) {
                    ref.read(selectedCategoryProvider.notifier).state = value;
                  }
                },
                items: Category.values.map((category) {
                  return DropdownMenuItem<Category>(
                    value: category,
                    child: Text(category.name),
                  );
                }).toList(),
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
                      return MonsterListTile(
                        name: item.name,
                      );
                    } else if (item is MagicItems) {
                      return ListTile(
                        title: Text(item.name),
                      );
                    } else if (item is Classes) {
                      return ListTile(
                        title: Text(item.name),
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
