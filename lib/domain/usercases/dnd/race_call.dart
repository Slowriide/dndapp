import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/race.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/race_repository.dart';

class RaceCallUseCase implements Usecase<Race, String> {
  final RaceRepository repository;

  RaceCallUseCase(this.repository);
  @override
  Future<Race> call({required String params}) async {
    return await repository.getRace(params);
  }
}
