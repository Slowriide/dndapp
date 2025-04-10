import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';

abstract class LocalStorageRepository {
  Future<void> toggleFavorite(Monster monster);

  Future<bool> isFavorite(String monsterId);

  Future<List<Monster>> loadMonsters({int limit = 10, offset = 0});
}
