import 'package:dnd_app/presentation/providers/dnd_provders.dart';
import 'package:dnd_app/presentation/providers/filter_provider/state_filter_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryDataProvider = Provider<AsyncValue<List<dynamic>>>((ref) {
  final selectedCategory = ref.watch(selectedCategoryProvider);

  switch (selectedCategory) {
    case Category.monsters:
      return ref.watch(monstersProvider);
    case Category.magicItems:
      return ref.watch(magicItemsProvider);
    case Category.classes:
      return ref.watch(classesrovider);
  }
});
