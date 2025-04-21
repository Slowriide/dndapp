import 'package:dnd_app/data/repositories/storage/spells_storage_repository.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/spell.dart';
import 'package:dnd_app/presentation/providers/db/local_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteSpellsProvider =
    StateNotifierProvider<StorageSpellsNotifier, Map<String, Spell>>((ref) {
  final spellStorageRepository = ref.watch(spellsStorageRepositoryProvider);

  return StorageSpellsNotifier(
    localStorageRepository: spellStorageRepository,
  );
});

class StorageSpellsNotifier extends StateNotifier<Map<String, Spell>> {
  int page = 0;
  final SpellsStorageRepository localStorageRepository;

  StorageSpellsNotifier({required this.localStorageRepository}) : super({});

  Future<List<Spell>> loadNextPage() async {
    final spellList = await localStorageRepository.loadSpells(
      offset: page * 10,
      limit: 20,
    );
    page++;

    final tempSpellsMap = <String, Spell>{};
    for (final spell in spellList) {
      tempSpellsMap[spell.index] = spell;
    }

    state = {...state, ...tempSpellsMap};

    return spellList;
  }

  Future<void> toggleFavorite(Spell spell) async {
    await localStorageRepository.toggleSpellFavorite(spell);
    final isInFavorites = state[spell.index] != null;

    if (isInFavorites) {
      state.remove(spell.index);
      state = {...state};
    } else {
      state = {...state, spell.index: spell};
    }
  }
}
