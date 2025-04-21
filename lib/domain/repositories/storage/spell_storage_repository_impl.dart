import 'package:dnd_app/data/repositories/storage/spells_storage_repository.dart';

import 'package:dnd_app/data/sources/database/local_storage_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/specifics_entities.dart';

class SpellStorageRepositoryImpl extends SpellsStorageRepository {
  final LocalStorageDatasource datasource;

  SpellStorageRepositoryImpl(this.datasource);

  @override
  Future<bool> isSpellFavorite(String spellId) {
    return datasource.isSpellFavorite(spellId);
  }

  @override
  Future<List<Spell>> loadSpells({int limit = 10, offset = 0}) {
    return datasource.loadSpells(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleSpellFavorite(Spell spell) {
    return datasource.toggleSpellFavorite(spell);
  }
}
