import 'package:dnd_app/core/usecase/usecase.dart';

import 'package:dnd_app/domain/entities/dnd/monsters.dart';

import 'package:dnd_app/domain/repositories/dnd/monsters_repository.dart';
import 'package:dnd_app/service_locator.dart';

class MonstersCallUserCase implements Usecase<List<Monsters>, void> {
  final MonstersRepository repository;

  MonstersCallUserCase(this.repository);
  @override
  Future<List<Monsters>> call({void params}) async {
    return await repository.getMonsters();
  }
}
