import 'package:dnd_app/data/repositories/storage/races_storage_repository.dart';
import 'package:dnd_app/data/sources/database/local_storage_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/specifics_entities.dart';

class RacesStorageRepositoryImpl extends RacesStorageRepository {
  final LocalStorageDatasource datasource;

  RacesStorageRepositoryImpl(this.datasource);

  @override
  Future<bool> isRaceFavorite(String raceId) {
    return datasource.isRaceFavorite(raceId);
  }

  @override
  Future<List<Race>> loadRaces({int limit = 10, offset = 0}) {
    return datasource.loadRaces(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleRaceFavorite(Race race) {
    return datasource.toggleRaceFavorite(race);
  }
}
