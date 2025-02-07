import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/monster_repository.dart';
import 'package:dnd_app/service_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final monsterInfoProvider =
    StateNotifierProvider<MonsterMapNotifier, Map<String, Monster>>(
  (ref) {
    final repository = sl<MonsterRepository>();

    return MonsterMapNotifier(getMonster: repository.getMonster);
  },
);

/*
  {
  'aboleth': Monster(),
  'blue-eyes-White-dragon-': Monster(),
  }
*/

typedef GetMonsterCallback = Future<Monster> Function(String id);

class MonsterMapNotifier extends StateNotifier<Map<String, Monster>> {
  final GetMonsterCallback getMonster;

  MonsterMapNotifier({required this.getMonster}) : super({});

  Future<void> loadMonster(String id) async {
    if (state[id] != null) return;
    // ignore: avoid_print
    print('realizando peticion http');
    final monster = await getMonster(id);

    state = {...state, id: monster};
  }
}
