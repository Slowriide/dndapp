import 'package:dnd_app/domain/entities/dnd/monsters.dart';

abstract class MonstersRepository {
  Future<List<Monsters>> getMonsters();
}
