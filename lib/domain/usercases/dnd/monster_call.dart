import 'package:dnd_app/core/usecase/usecase.dart';

import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';

import 'package:dnd_app/domain/repositories/dnd/monster_repository.dart';

class MonsterCallUsecase implements Usecase<Monster, String> {
  final MonsterRepository repository;

  MonsterCallUsecase(this.repository);
  @override
  Future<Monster> call({required String params}) async {
    return await repository.getMonster(params);
  }
}
