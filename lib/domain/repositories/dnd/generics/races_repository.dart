import 'package:dnd_app/domain/entities/dnd/generics/races.dart';

abstract class RacesRepository {
  Future<List<Races>> getRaces();
}
