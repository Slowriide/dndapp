import 'package:dnd_app/core/usecase/usecase.dart';

import 'package:dnd_app/domain/entities/dnd/generics/monsters.dart';
import 'package:dnd_app/domain/repositories/dnd/generics/monsters_repository.dart';

class MonstersCallUserCase implements Usecase<List<Monsters>, void> {
  final MonstersRepository repository;

  MonstersCallUserCase(this.repository);
  @override
  Future<List<Monsters>> call({void params}) async {
    return await repository.getMonsters();
  }
}
