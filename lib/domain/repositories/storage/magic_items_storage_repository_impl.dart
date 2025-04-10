import 'package:dnd_app/data/repositories/storage/magic_items_storage_repository.dart';
import 'package:dnd_app/data/sources/database/local_storage_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/specifics_entities.dart';

class MagicItemsStorageRepositoryImpl extends MagicItemsStorageRepository {
  final LocalStorageDatasource datasource;

  MagicItemsStorageRepositoryImpl(this.datasource);

  @override
  Future<bool> isMagicItemFavorite(String magicItemId) {
    return datasource.isMagicItemFavorite(magicItemId);
  }

  @override
  Future<List<MagicItem>> loadMagicItems({int limit = 10, offset = 0}) {
    return datasource.loadMagicItems(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleMagicItemFavorite(MagicItem magicItem) {
    return datasource.toggleMagicItemFavorite(magicItem);
  }
}
