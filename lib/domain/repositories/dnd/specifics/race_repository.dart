import 'package:dnd_app/domain/entities/dnd/specifics/race.dart';

abstract class RaceRepository {
  Future<Race> getRace(String id);
}
