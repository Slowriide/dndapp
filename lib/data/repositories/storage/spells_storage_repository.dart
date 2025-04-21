import 'package:dnd_app/domain/entities/dnd/specifics/specifics_entities.dart';

abstract class SpellsStorageRepository {
  Future<void> toggleSpellFavorite(Spell spell);

  Future<bool> isSpellFavorite(String spellId);

  Future<List<Spell>> loadSpells({int limit = 10, offset = 0});
}
