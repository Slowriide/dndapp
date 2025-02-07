import 'package:dnd_app/domain/entities/dnd/specifics/spell.dart';

abstract class SpellRepository {
  Future<Spell> getSpell(String id);
}
