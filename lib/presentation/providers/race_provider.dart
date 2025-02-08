import 'package:dnd_app/domain/entities/dnd/specifics/race.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/race_repository.dart';
import 'package:dnd_app/service_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final raceInfoProvider =
    StateNotifierProvider<RaceMapNotifier, Map<String, Race>>(
  (ref) {
    final repository = sl<RaceRepository>();

    return RaceMapNotifier(getRace: repository.getRace);
  },
);

/*
  {
  'aboleth': Monster(),
  'blue-eyes-White-dragon-': Monster(),
  }
*/

typedef GetRaceCallback = Future<Race> Function(String id);

class RaceMapNotifier extends StateNotifier<Map<String, Race>> {
  final GetRaceCallback getRace;

  RaceMapNotifier({required this.getRace}) : super({});

  Future<void> loadRace(String id) async {
    if (state[id] != null) return;
    // ignore: avoid_print
    print('realizando peticion http');
    final race = await getRace(id);

    state = {...state, id: race};
  }
}
