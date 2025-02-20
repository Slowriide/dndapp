import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/race_traits.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/race_traits_repository.dart';

class RaceTraitsCallUsecase implements Usecase<List<RaceTrait>, String> {
  final RaceTraitsRepository repository;

  RaceTraitsCallUsecase(this.repository);
  @override
  Future<List<RaceTrait>> call({required String params}) async {
    return await repository.getRaceTrait(params);
  }
}
