import 'package:dnd_app/data/repositories/storage/magic_items_storage_repository.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/specifics_entities.dart';
import 'package:dnd_app/presentation/providers/db/local_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteMagicItemsProvider =
    StateNotifierProvider<StorageMagicItemsNotifier, Map<String, MagicItem>>(
        (ref) {
  final magicItemsStorageRepository =
      ref.watch(magicItemsStorageRepositoryProvider);

  return StorageMagicItemsNotifier(
      magicItemsStorageRepository: magicItemsStorageRepository);
});

class StorageMagicItemsNotifier extends StateNotifier<Map<String, MagicItem>> {
  int page = 0;
  final MagicItemsStorageRepository magicItemsStorageRepository;

  StorageMagicItemsNotifier({required this.magicItemsStorageRepository})
      : super({});

  Future<List<MagicItem>> loadNextPage() async {
    final items = await magicItemsStorageRepository.loadMagicItems(
        offset: page * 10, limit: 20);
    page++;

    final tempMap = <String, MagicItem>{};
    for (final item in items) {
      tempMap[item.index] = item;
    }

    state = {...state, ...tempMap};

    return items;
  }

  Future<void> toggleFavorite(MagicItem magicItem) async {
    await magicItemsStorageRepository.toggleMagicItemFavorite(magicItem);
    final bool isFavorite = state[magicItem.index] != null;

    if (isFavorite) {
      state.remove(magicItem.index);
      state = {...state};
    } else {
      state = {...state, magicItem.index: magicItem};
    }
  }
}
