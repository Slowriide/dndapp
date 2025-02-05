import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/domain/entities/dnd/generics/generic_entities.dart';

import 'package:dnd_app/domain/repositories/dnd/spells_repository.dart';

class SpellsCallUserCase implements Usecase<List<Spells>, void> {
  final SpellsRepository repository;

  SpellsCallUserCase(this.repository);
  @override
  Future<List<Spells>> call({void params}) async {
    return await repository.getSpells();
  }
}
