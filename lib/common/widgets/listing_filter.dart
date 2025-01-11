import 'package:dnd_app/presentation/providers/filter_provider/state_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListingFilter extends ConsumerWidget {
  const ListingFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final theme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: theme.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Category>(
                borderRadius: BorderRadius.circular(8),
                style: textStyles.bodyLarge,
                value: selectedCategory,
                icon: const _IconGrid(),
                dropdownColor: theme.primary,
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
        ),
      ],
    );
  }
}

class _IconGrid extends StatelessWidget {
  const _IconGrid();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(3, (rowIndex) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(3, (colIndex) {
              return Container(
                margin: const EdgeInsets.all(2.0),
                width: 4.0,
                height: 4.0,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}
