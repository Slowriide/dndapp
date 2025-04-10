import 'package:dnd_app/domain/entities/dnd/specifics/specifics_entities.dart';

abstract class MagicItemsStorageRepository {
  Future<void> toggleMagicItemFavorite(MagicItem monster);

  Future<bool> isMagicItemFavorite(String monsterId);

  Future<List<MagicItem>> loadMagicItems({int limit = 10, offset = 0});
}
