import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/race.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/race_repository.dart';

class RaceRepositoryImpl extends RaceRepository {
  final DndDatasource datasource;

  RaceRepositoryImpl(this.datasource);

  @override
  Future<Race> getRace(String id) async {
    return await datasource.getRace(id);
  }
}
