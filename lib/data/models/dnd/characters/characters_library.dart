import 'package:dnd_app/data/models/dnd/characters/character.dart';
import 'package:flutter/material.dart';

final List<Character> charactersLibrary = [
  Character(
    name: 'Valanthe Liadon',
    level: '1',
    race: Race.elf,
    characterClass: CharacterClass.wizard,
    image: const SizedBox(
      height: 25,
      width: 25,
      child: Placeholder(),
    ),
  ),
  Character(
    name: 'Siri',
    level: '10',
    race: Race.human,
    characterClass: CharacterClass.warlock,
    image: const SizedBox(
      height: 25,
      width: 25,
      child: Placeholder(),
    ),
  ),
];
