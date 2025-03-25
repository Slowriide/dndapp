import 'package:dnd_app/presentation/providers/dnd_provders.dart';
import 'package:dnd_app/presentation/providers/filter_provider/state_filter_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SortOrder { aToZ, zToA }

final searchQueryProvider = StateProvider<String>((ref) => '');

final sortOrderProvider = StateProvider<SortOrder>((ref) => SortOrder.aToZ);

final categoryDataProvider = Provider<AsyncValue<List<dynamic>>>((ref) {
  final selectedCategory = ref.watch(selectedCategoryProvider);
  final searchQuery = ref.watch(searchQueryProvider).toLowerCase();
  final sortOrder = ref.watch(sortOrderProvider);

  final AsyncValue<List<dynamic>> data;

  switch (selectedCategory) {
    case Category.monsters:
      data = ref.watch(monstersProvider);
      break;
    case Category.magicItems:
      data = ref.watch(magicItemsProvider);
      break;
    case Category.classes:
      data = ref.watch(classesProvider);
      break;
    case Category.equipment:
      data = ref.watch(equipmentProvider);
      break;
    case Category.races:
      data = ref.watch(racesProvider);
      break;
    case Category.spells:
      data = ref.watch(spellsProvider);
      break;
  }

  return data.whenData((items) {
    if (searchQuery.isNotEmpty) {
      items = items.where((item) {
        final name = (item as dynamic).name.toLowerCase();
        return name.contains(searchQuery);
      }).toList();
    }

    // Aplicar el orden A-Z o Z-A
    if (sortOrder == SortOrder.aToZ) {
      items.sort((a, b) => (a as dynamic).name.compareTo((b as dynamic).name));
    } else if (sortOrder == SortOrder.zToA) {
      items.sort((a, b) => (b as dynamic).name.compareTo((a as dynamic).name));
    }

    return items;
  });
});
