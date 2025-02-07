import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/monster_repository.dart';

class MonsterRepositoryImpl extends MonsterRepository {
  final DndDatasource datasource;

  MonsterRepositoryImpl(this.datasource);

  @override
  Future<Monster> getMonster(String id) async {
    return await datasource.getMonster(id);
  }
}
