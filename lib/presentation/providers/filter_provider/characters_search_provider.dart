import 'package:dnd_app/data/models/dnd/characters/character.dart';
import 'package:dnd_app/data/models/dnd/characters/characters_library.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final charactersQueryProvider = StateProvider<String>((ref) => '');

final charactersFilterProvider = Provider<List<Character>>((ref) {
  final searchQuery = ref.watch(charactersQueryProvider).toLowerCase();

  if (searchQuery.isEmpty) return charactersLibrary;

  return charactersLibrary.where((character) {
    final nameMatch = character.name.toLowerCase().contains(searchQuery);
    final raceMatch =
        character.race.toString().toLowerCase().contains(searchQuery);
    final classMatch =
        character.characterClass.toString().toLowerCase().contains(searchQuery);

    return nameMatch || raceMatch || classMatch;
  }).toList();
});
