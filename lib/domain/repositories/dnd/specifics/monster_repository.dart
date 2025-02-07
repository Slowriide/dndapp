import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';

abstract class MonsterRepository {
  Future<Monster> getMonster(String id);
}
