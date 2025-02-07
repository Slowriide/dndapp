import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/spell.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/spell_repository.dart';

class SpellRepositoryImpl extends SpellRepository {
  final DndDatasource datasource;

  SpellRepositoryImpl(this.datasource);

  @override
  Future<Spell> getSpell(String id) async {
    return await datasource.getSpell(id);
  }
}
