import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';

import 'package:dnd_app/domain/entities/dnd/generics/races.dart';

import 'package:dnd_app/domain/repositories/dnd/races_repository.dart';

class RacesRepositoryImpl extends RacesRepository {
  final DndDatasource datasource;

  RacesRepositoryImpl(this.datasource);

  @override
  Future<List<Races>> getRaces() async {
    return await datasource.getRaces();
  }
}
