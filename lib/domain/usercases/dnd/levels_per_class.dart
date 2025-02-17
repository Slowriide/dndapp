import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/class_levels.dart';

import 'package:dnd_app/domain/repositories/dnd/specifics/levels_class.dart';

class LevelPerClassCallUsecase implements Usecase<List<LevelPerClass>, String> {
  final LevelsPerClassRepository repository;

  LevelPerClassCallUsecase(this.repository);
  @override
  Future<List<LevelPerClass>> call({required String params}) async {
    return await repository.getLevels(params);
  }
}
