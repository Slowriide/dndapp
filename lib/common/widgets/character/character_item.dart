import 'package:dnd_app/data/models/dnd/characters/character.dart';
import 'package:dnd_app/data/models/dnd/characters/class_extension.dart';
import 'package:dnd_app/data/models/dnd/characters/race_extensions.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final String name;
  final String level;
  final Race race;
  final CharacterClass characterClass;
  final Widget image;
  const CharacterItem({
    super.key,
    required this.name,
    required this.level,
    required this.race,
    required this.characterClass,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: theme.primary,
      ),
      width: double.infinity,
      height: 82,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: image,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(name),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Level $level',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      const Text(' | ', style: TextStyle(color: Colors.red)),
                      Text(
                        race.displayName,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                  Text(
                    characterClass.displayName,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  )
                ],
              )
            ],
          ),
          Positioned(
            right: -5,
            top: -5,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                size: 25,
                color: Color.fromARGB(255, 230, 228, 228),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
