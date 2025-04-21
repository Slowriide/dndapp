import 'package:dnd_app/domain/entities/dnd/favoriteable.dart';
import 'package:dnd_app/presentation/providers/db/favorite_classes_provider.dart';
import 'package:dnd_app/presentation/providers/db/favorite_equipment_provider.dart';
import 'package:dnd_app/presentation/providers/db/favorite_magic_items_provider.dart';
import 'package:dnd_app/presentation/providers/db/favorite_provider.dart';
import 'package:dnd_app/presentation/providers/db/favorite_races_provider.dart';
import 'package:dnd_app/presentation/providers/db/favorite_spells_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allFavoritesProvider = Provider<List<Favoritable>>((ref) {
  final monsters = ref.watch(favoriteMonstersProvider);
  final magicItems = ref.watch(favoriteMagicItemsProvider);
  final equipment = ref.watch(favoriteEquipmentProvider);
  final races = ref.watch(favoriteRacesProvider);
  final classes = ref.watch(favoriteDndClassesProvider);
  final spells = ref.watch(favoriteSpellsProvider);

  return [
    ...monsters.values,
    ...magicItems.values,
    ...equipment.values,
    ...races.values,
    ...classes.values,
    ...spells.values,
  ];
});
