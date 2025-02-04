import 'package:dnd_app/domain/entities/dnd/generics/monsters.dart';

abstract class MonstersRepository {
  Future<List<Monsters>> getMonsters();
}
