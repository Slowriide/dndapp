import 'package:dnd_app/data/models/dnd/race/ability_bonus.dart';
import 'package:dnd_app/data/models/dnd/race/starting_prof.dart';
import 'package:dnd_app/data/models/dnd/race/subrace/subrace_details/language_options.dart';
import 'package:dnd_app/data/models/dnd/race/subrace/subrace_details/racial_trait.dart';
import 'package:dnd_app/data/models/dnd/race/subrace/subrace_details/subrace_race.dart';

class Subrace {
  String? index;
  String? name;
  SubraceRace? race;
  String? desc;
  List<AbilityBonus>? abilityBonuses;
  List<StartingProficencies>? startingProficiencies;
  List<dynamic>? languages;
  LanguageOptions? languageOptions;
  List<RacialTrait>? racialTraits;
  String? url;
  DateTime? updatedAt;

  Subrace({
    this.index,
    this.name,
    this.race,
    this.desc,
    this.abilityBonuses,
    this.startingProficiencies,
    this.languages,
    this.languageOptions,
    this.racialTraits,
    this.url,
    this.updatedAt,
  });
}
