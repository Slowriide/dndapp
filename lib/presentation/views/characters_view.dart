import 'package:dnd_app/common/widgets/character_item.dart';
import 'package:dnd_app/presentation/providers/filter_provider/characters_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharactersView extends ConsumerStatefulWidget {
  const CharactersView({super.key});

  @override
  _CharactersViewState createState() => _CharactersViewState();
}

class _CharactersViewState extends ConsumerState<CharactersView> {
  @override
  Widget build(BuildContext context) {
    ref.watch(charactersQueryProvider);
    final searchResults = ref.watch(charactersFilterProvider);

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final character = searchResults[index];
              return Column(
                children: [
                  CharacterItem(
                    name: character.name,
                    level: character.level,
                    race: character.race,
                    characterClass: character.characterClass,
                    image: character.image,
                  ),
                ],
              );
            },
            childCount: searchResults.length,
          ),
        ),
      ],
    );
  }
}
