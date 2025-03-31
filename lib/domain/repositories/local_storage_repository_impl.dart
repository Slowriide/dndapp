import 'package:dnd_app/data/repositories/local_storage_repository.dart';
import 'package:dnd_app/data/sources/database/local_storage_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl(this.datasource);

  @override
  Future<bool> isFavorite(String monsterId) {
    return datasource.isFavorite(monsterId);
  }

  @override
  Future<List<Monster>> loadMonsters({int limit = 10, offset = 0}) {
    return datasource.loadMonsters(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Monster monster) {
    return datasource.toggleFavorite(monster);
  }
}
