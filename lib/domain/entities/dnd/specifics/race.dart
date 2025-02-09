import 'package:dnd_app/data/models/dnd/race/ability_bonus.dart';
import 'package:dnd_app/data/models/dnd/race/lenguaje.dart';
import 'package:dnd_app/data/models/dnd/race/race_subraces.dart';
import 'package:dnd_app/data/models/dnd/race/race_traits.dart';
import 'package:dnd_app/data/models/dnd/race/starting_prof.dart';

class Race {
  final String index;
  final String name;
  final int speed;
  final List<AbilityBonus>? abilityBonuses;
  final String age;
  final String alignment;
  final String size;
  final String sizeDescription;
  final List<StartingProficencies>? startingProficiencies;
  final List<Language> languages;
  final String languageDesc;
  final List<RaceTraits>? traits;
  final List<RaceSubraces>? subraces;
  final String url;
  final DateTime updatedAt;

  Race({
    required this.index,
    required this.name,
    required this.speed,
    required this.abilityBonuses,
    required this.age,
    required this.alignment,
    required this.size,
    required this.sizeDescription,
    required this.startingProficiencies,
    required this.languages,
    required this.languageDesc,
    required this.traits,
    required this.subraces,
    required this.url,
    required this.updatedAt,
  });
}
