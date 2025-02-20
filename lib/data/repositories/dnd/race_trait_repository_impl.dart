import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/race_traits.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/race_traits_repository.dart';

class RaceTraitsRepositoryImpl extends RaceTraitsRepository {
  final DndDatasource datasource;

  RaceTraitsRepositoryImpl(this.datasource);

  @override
  Future<List<RaceTrait>> getRaceTrait(String id) async {
    return await datasource.getRaceTrait(id);
  }
}
