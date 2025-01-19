import 'package:dnd_app/common/widgets/character_item.dart';
import 'package:dnd_app/data/models/dnd/characters/characters_library.dart';
import 'package:flutter/material.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final character = charactersLibrary[index];
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
            childCount: charactersLibrary.length,
          ),
        ),
      ],
    );
  }
}
