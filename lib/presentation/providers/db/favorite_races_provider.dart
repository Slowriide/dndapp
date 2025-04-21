import 'package:dnd_app/data/repositories/storage/races_storage_repository.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/race.dart';
import 'package:dnd_app/presentation/providers/db/local_storage_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteRacesProvider =
    StateNotifierProvider<StorageRacesNotifier, Map<String, Race>>((ref) {
  final raceStorageRepository = ref.watch(racesStorageRepositoryProvider);

  return StorageRacesNotifier(
    localStorageRepository: raceStorageRepository,
  );
});

class StorageRacesNotifier extends StateNotifier<Map<String, Race>> {
  int page = 0;
  final RacesStorageRepository localStorageRepository;

  StorageRacesNotifier({required this.localStorageRepository}) : super({});

  Future<List<Race>> loadNextPage() async {
    final raceList = await localStorageRepository.loadRaces(
      offset: page * 10,
      limit: 20,
    );
    page++;

    final tempRaceMap = <String, Race>{};
    for (final race in raceList) {
      tempRaceMap[race.index] = race;
    }

    state = {...state, ...tempRaceMap};

    return raceList;
  }

  Future<void> toggleFavorite(Race race) async {
    await localStorageRepository.toggleRaceFavorite(race);
    final bool isInFavorites = state[race.index] != null;
    if (isInFavorites) {
      state.remove(race.index);
      state = {...state};
    } else {
      state = {...state, race.index: race};
    }
  }
}
