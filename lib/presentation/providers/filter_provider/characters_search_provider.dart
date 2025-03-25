import 'package:dnd_app/data/models/dnd/characters/character.dart';
import 'package:dnd_app/data/models/dnd/characters/characters_library.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SortOrder { aToZ, zToA }

final charactersQueryProvider = StateProvider<String>((ref) => '');

final sortOrderProviderCharacters =
    StateProvider<SortOrder>((ref) => SortOrder.aToZ);

final charactersFilterProvider = Provider<List<Character>>((ref) {
  final searchQuery = ref.watch(charactersQueryProvider).toLowerCase();
  final sortOrder = ref.watch(sortOrderProviderCharacters);

  List<Character> filteredCharacters = charactersLibrary.where((character) {
    final nameMatch = character.name.toLowerCase().contains(searchQuery);
    final raceMatch =
        character.race.toString().toLowerCase().contains(searchQuery);
    final classMatch =
        character.characterClass.toString().toLowerCase().contains(searchQuery);

    return nameMatch || raceMatch || classMatch;
  }).toList();

  if (sortOrder == SortOrder.aToZ) {
    filteredCharacters.sort((a, b) => a.name.compareTo(b.name));
  } else if (sortOrder == SortOrder.zToA) {
    filteredCharacters.sort((a, b) => b.name.compareTo(a.name));
  }

  return filteredCharacters;
});
