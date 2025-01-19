import 'package:flutter/material.dart';

class Character {
  final String name;
  final String level;
  final Race race;
  final CharacterClass characterClass;
  final Widget image;

  Character({
    required this.name,
    required this.level,
    required this.race,
    required this.characterClass,
    required this.image,
  });
}

enum Race {
  elf,
  human,
  dwarf,
  tifling,
}

enum CharacterClass {
  wizard,
  paladin,
  warrior,
  monge,
  rouge,
  warlock,
}
