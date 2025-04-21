import 'package:dnd_app/data/models/dnd/race/ability_bonus.dart';
import 'package:dnd_app/data/models/dnd/race/lenguaje.dart';
import 'package:dnd_app/data/models/dnd/race/race_subraces.dart';
import 'package:dnd_app/data/models/dnd/race/race_traits.dart';
import 'package:dnd_app/data/models/dnd/race/starting_prof.dart';
import 'package:dnd_app/domain/entities/dnd/favoriteable.dart';
import 'package:isar/isar.dart';

part 'race.g.dart';

@collection
class Race implements Favoritable {
  Id? isarId;
  final String index;
  final String name;
  @ignore
  final int? speed;
  @ignore
  final List<AbilityBonus>? abilityBonuses;
  @ignore
  final String? age;
  @ignore
  final String? alignment;
  @ignore
  final String? size;
  @ignore
  final String? sizeDescription;
  @ignore
  final List<StartingProficencies>? startingProficiencies;
  @ignore
  final List<Language>? languages;
  @ignore
  final String? languageDesc;
  @ignore
  final List<RaceTraits>? traits;
  @ignore
  final List<RaceSubraces>? subraces;
  final String url;
  final DateTime updatedAt;

  Race({
    required this.index,
    required this.name,
    this.speed,
    this.abilityBonuses,
    this.age,
    this.alignment,
    this.size,
    this.sizeDescription,
    this.startingProficiencies,
    this.languages,
    this.languageDesc,
    this.traits,
    this.subraces,
    required this.url,
    required this.updatedAt,
  });

  @override
  String get displayId => index;

  @override
  String get displayName => name;
  @override
  String get imageUrl =>
      'https://cdn3.futbin.com/content/fifa25/img/players/p134475262.png?fm=png&ixlib=java-2.1.0&verzion=1&w=252&s=e1e6294f3cbf185c802b60c63f8f00fa';
  @override
  String get navigatePath => '/home/0/api/2014/races/$index';
}
