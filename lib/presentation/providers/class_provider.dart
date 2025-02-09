import 'package:dnd_app/domain/entities/dnd/specifics/class.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/race.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/class_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/race_repository.dart';
import 'package:dnd_app/service_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final classInfoProvider =
    StateNotifierProvider<ClassMapNotifier, Map<String, Class>>(
  (ref) {
    final repository = sl<ClassRepository>();

    return ClassMapNotifier(getClass: repository.getClass);
  },
);

/*
  {
  'aboleth': Monster(),
  'blue-eyes-White-dragon-': Monster(),
  }
*/

typedef GetClassCallback = Future<Class> Function(String id);

class ClassMapNotifier extends StateNotifier<Map<String, Class>> {
  final GetClassCallback getClass;

  ClassMapNotifier({required this.getClass}) : super({});

  Future<void> loadClass(String id) async {
    if (state[id] != null) return;
    // ignore: avoid_print
    print('realizando peticion http');
    final classes = await getClass(id);

    state = {...state, id: classes};
  }
}
