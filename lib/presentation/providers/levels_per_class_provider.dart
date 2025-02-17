import 'package:dnd_app/domain/entities/dnd/specifics/class_levels.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/levels_class.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/monster_repository.dart';
import 'package:dnd_app/service_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final levelrPerClassInfoProvider = StateNotifierProvider<
    LevelsPerClassMapNotifier, Map<String, List<LevelPerClass>>>(
  (ref) {
    final repository = sl<LevelsPerClassRepository>();

    return LevelsPerClassMapNotifier(getLevelPerClass: repository.getLevels);
  },
);

/*
  {
  'aboleth': Monster(),
  'blue-eyes-White-dragon-': Monster(),
  }
*/

typedef GetLevelsPerClassCallback = Future<List<LevelPerClass>> Function(
    String id);

class LevelsPerClassMapNotifier
    extends StateNotifier<Map<String, List<LevelPerClass>>> {
  final GetLevelsPerClassCallback getLevelPerClass;

  LevelsPerClassMapNotifier({required this.getLevelPerClass}) : super({});

  Future<void> loadLevels(String id) async {
    if (state.containsKey(id)) return;
    // ignore: avoid_print
    print('realizando peticion http lvl');
    final levels = await getLevelPerClass(id);

    state = {...state, id: levels};
  }
}
