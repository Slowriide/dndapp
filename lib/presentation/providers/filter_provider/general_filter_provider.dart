import 'package:dnd_app/presentation/providers/dnd_provders.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final generalSearchQueryProvider = StateProvider<String>((ref) => '');

final generalSearchProvider = FutureProvider<List<dynamic>>((ref) async {
  final query = ref.watch(generalSearchQueryProvider).toLowerCase();

  // Cargar todos los datos
  final monsters = await ref.watch(monstersProvider.future);
  final magicItems = await ref.watch(magicItemsProvider.future);
  final classes = await ref.watch(classesProvider.future);
  final equipment = await ref.watch(equipmentProvider.future);
  final races = await ref.watch(racesProvider.future);
  final spells = await ref.watch(spellsProvider.future);

  final allItems = [
    ...monsters,
    ...magicItems,
    ...classes,
    ...equipment,
    ...races,
    ...spells
  ];

  // Filtrar elementos según el query
  return allItems.where((item) {
    final itemName = (item as dynamic).name.toLowerCase();
    return itemName.contains(query);
  }).toList();
});
