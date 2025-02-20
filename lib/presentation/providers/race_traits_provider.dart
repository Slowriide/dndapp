import 'package:dnd_app/domain/entities/dnd/specifics/race_traits.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/race_traits_repository.dart';
import 'package:dnd_app/service_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final raceTraitInfoProvider =
    StateNotifierProvider<RaceTraitsMapNotifier, Map<String, List<RaceTrait>>>(
  (ref) {
    final repository = sl<RaceTraitsRepository>();

    return RaceTraitsMapNotifier(getRaceTrait: repository.getRaceTrait);
  },
);

/*
  {
  'aboleth': Monster(),
  'blue-eyes-White-dragon-': Monster(),
  }
*/

typedef RaceTraitCallback = Future<List<RaceTrait>> Function(String id);

class RaceTraitsMapNotifier
    extends StateNotifier<Map<String, List<RaceTrait>>> {
  final RaceTraitCallback getRaceTrait;

  RaceTraitsMapNotifier({required this.getRaceTrait}) : super({});

  Future<void> loadRaceTrait(String id) async {
    if (state.containsKey(id)) return;
    // ignore: avoid_print
    print('realizando peticion http lvl');
    final feature = await getRaceTrait(id);

    state = {...state, id: feature};
  }
}
