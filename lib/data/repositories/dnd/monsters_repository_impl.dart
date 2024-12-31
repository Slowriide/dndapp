import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/monsters.dart';
import 'package:dnd_app/domain/repositories/dnd/monsters_repository.dart';

class MonstersRepositoryImpl extends MonstersRepository {
  final DndDatasource datasource;

  MonstersRepositoryImpl(this.datasource);

  @override
  Future<List<Monsters>> getMonsters() async {
    return await datasource.getMonsters(); //delego la llamada al datasource
  }
}
