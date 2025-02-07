import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';

import 'package:dnd_app/domain/entities/dnd/generics/spells.dart';

import 'package:dnd_app/domain/repositories/dnd/generics/spells_repository.dart';

class SpellsRepositoryImpl extends SpellsRepository {
  final DndDatasource datasource;

  SpellsRepositoryImpl(this.datasource);

  @override
  Future<List<Spells>> getSpells() async {
    return await datasource.getSpells();
  }
}
