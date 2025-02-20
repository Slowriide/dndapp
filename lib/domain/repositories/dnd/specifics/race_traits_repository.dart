import 'package:dnd_app/domain/entities/dnd/specifics/race_traits.dart';

abstract class RaceTraitsRepository {
  Future<List<RaceTrait>> getRaceTrait(String id);
}
