import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/domain/entities/dnd/generics/generic_entities.dart';

import 'package:dnd_app/domain/repositories/dnd/generics/races_repository.dart';

class RacesCallUserCase implements Usecase<List<Races>, void> {
  final RacesRepository repository;

  RacesCallUserCase(this.repository);
  @override
  Future<List<Races>> call({void params}) async {
    return await repository.getRaces();
  }
}
