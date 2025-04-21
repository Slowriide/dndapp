import 'package:dnd_app/domain/entities/dnd/specifics/race.dart';

abstract class RacesStorageRepository {
  Future<void> toggleRaceFavorite(Race race);

  Future<bool> isRaceFavorite(String raceId);

  Future<List<Race>> loadRaces({int limit = 10, offset = 0});
}
