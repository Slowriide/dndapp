import 'package:dnd_app/domain/entities/dnd/specifics/class_levels.dart';

abstract class LevelsPerClassRepository {
  Future<List<LevelPerClass>> getLevels(String id);
}
