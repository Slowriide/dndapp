import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/subclasses/subclass_levels.dart';

import 'package:dnd_app/domain/repositories/dnd/specifics/subclass/subclass_levels_repository.dart';

class SubclassLevelsCallUsecase
    implements Usecase<List<SubclassLevels>, String> {
  final SubclassLevelsRepository repository;

  SubclassLevelsCallUsecase(this.repository);
  @override
  Future<List<SubclassLevels>> call({required String params}) async {
    return await repository.getSubclassLevels(params);
  }
}
