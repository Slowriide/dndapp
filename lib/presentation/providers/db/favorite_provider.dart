import 'package:dnd_app/data/repositories/storage/local_storage_repository.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';
import 'package:dnd_app/presentation/providers/db/local_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteMonstersProvider =
    StateNotifierProvider<StorageMonstersNotifier, Map<String, Monster>>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);

  return StorageMonstersNotifier(
      localStorageRepository: localStorageRepository);
});

class StorageMonstersNotifier extends StateNotifier<Map<String, Monster>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageMonstersNotifier({required this.localStorageRepository}) : super({});

  Future<List<Monster>> loadNextPage() async {
    final monsters =
        await localStorageRepository.loadMonsters(offset: page * 10, limit: 20);
    page++;

    final tempMonstersMap = <String, Monster>{};
    for (final monster in monsters) {
      tempMonstersMap[monster.id] = monster;
    }

    state = {...state, ...tempMonstersMap};

    return monsters;
  }

  Future<void> toggleFavorite(Monster monster) async {
    await localStorageRepository.toggleFavorite(monster);
    final bool isMonsterInFavorites = state[monster.id] != null;
    if (isMonsterInFavorites) {
      state.remove(monster.id);
      state = {...state};
    } else {
      state = {...state, monster.id: monster};
    }
  }
}
