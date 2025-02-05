import 'package:dnd_app/domain/entities/dnd/generics/spells.dart';

abstract class SpellsRepository {
  Future<List<Spells>> getSpells();
}
