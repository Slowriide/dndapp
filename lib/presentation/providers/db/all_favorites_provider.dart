import 'package:dnd_app/domain/entities/dnd/favoriteable.dart';
import 'package:dnd_app/presentation/providers/db/favorite_magic_items_provider.dart';
import 'package:dnd_app/presentation/providers/db/favorite_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allFavoritesProvider = Provider<List<Favoritable>>((ref) {
  final monsters = ref.watch(favoriteMonstersProvider);
  final magicItems = ref.watch(favoriteMagicItemsProvider);

  return [...monsters.values, ...magicItems.values];
});
