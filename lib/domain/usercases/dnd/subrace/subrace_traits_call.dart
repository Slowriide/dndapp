import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/subrace/subrace_trait.dart';

import 'package:dnd_app/domain/repositories/dnd/specifics/subrace/subrace_trait_repository.dart';

class SubraceTraitsCallUsecase implements Usecase<List<SubraceTraits>, String> {
  final SubraceTraitsRepository repository;

  SubraceTraitsCallUsecase(this.repository);
  @override
  Future<List<SubraceTraits>> call({required String params}) async {
    return await repository.getSubraceTraits(params);
  }
}
