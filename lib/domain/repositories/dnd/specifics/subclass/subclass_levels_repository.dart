import 'package:dnd_app/domain/entities/dnd/specifics/subclasses/subclass_levels.dart';

abstract class SubclassLevelsRepository {
  Future<List<SubclassLevels>> getSubclassLevels(String id);
}
