import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';

import 'package:dnd_app/domain/entities/dnd/specifics/class_levels.dart';

import 'package:dnd_app/domain/repositories/dnd/specifics/levels_class.dart';

class LevelsPerClassRepositoryImpl extends LevelsPerClassRepository {
  final DndDatasource datasource;

  LevelsPerClassRepositoryImpl(this.datasource);

  @override
  Future<List<LevelPerClass>> getLevels(String id) async {
    return await datasource.getLevelsPerClass(id);
  }
}
