import 'package:dnd_app/data/models/dnd/race/ability_bonus.dart';
import 'package:dnd_app/data/models/dnd/race/lenguaje.dart';
import 'package:dnd_app/data/models/dnd/race/race_subraces.dart';
import 'package:dnd_app/data/models/dnd/race/race_traits.dart';
import 'package:dnd_app/data/models/dnd/race/starting_prof.dart';

class RaceDetails {
  final String index;
  final String name;
  final int speed;
  final List<AbilityBonus>? abilityBonuses;
  final String alignment;
  final String age;
  final String size;
  final String sizeDescription;
  final List<StartingProficencies>? startingProficiencies;
  final StartingProficiencyOptions? startingProficiencyOptions;
  final List<Language> languages;
  final String languageDesc;
  final List<RaceTraits>? traits;
  final List<RaceSubraces>? subraces;
  final String url;
  final DateTime updatedAt;

  RaceDetails({
    required this.index,
    required this.name,
    required this.speed,
    required this.abilityBonuses,
    required this.alignment,
    required this.age,
    required this.size,
    required this.sizeDescription,
    required this.startingProficiencies,
    required this.startingProficiencyOptions,
    required this.languages,
    required this.languageDesc,
    required this.traits,
    required this.subraces,
    required this.url,
    required this.updatedAt,
  });

  factory RaceDetails.fromJson(Map<String, dynamic> json) => RaceDetails(
        index: json["index"] ?? '',
        name: json["name"] ?? '',
        speed: json["speed"] != null ? json["speed"] as int : 0,
        abilityBonuses: json["ability_bonuses"] != null
            ? List<AbilityBonus>.from(
                json["ability_bonuses"].map((x) => AbilityBonus.fromJson(x)))
            : [],
        alignment: json["alignment"] ?? '',
        age: json["age"] ?? '',
        size: json["size"] ?? '',
        sizeDescription: json["size_description"] ?? '',
        startingProficiencies:
            (json["starting_proficiencies"] as List<dynamic>?)
                    ?.map((x) => StartingProficencies.fromJson(x))
                    .toList() ??
                [],
        startingProficiencyOptions: json["starting_proficiency_options"] != null
            ? StartingProficiencyOptions.fromJson(
                json["starting_proficiency_options"])
            : null,
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
        languageDesc: json["language_desc"] ?? '',
        traits: (json["traits"] as List<dynamic>?)
                ?.map((x) => RaceTraits.fromJson(x))
                .toList() ??
            [],
        subraces: (json["subraces"] as List<dynamic>?)
                ?.map((x) => RaceSubraces.fromJson(x))
                .toList() ??
            [],
        url: json["url"] ?? '',
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "name": name,
        "speed": speed,
        "ability_bonuses": abilityBonuses != null
            ? List<dynamic>.from(abilityBonuses!.map((x) => x.toJson()))
            : [],
        "alignment": alignment,
        "age": age,
        "size": size,
        "size_description": sizeDescription,
        "starting_proficiencies": startingProficiencies == null
            ? null
            : List<dynamic>.from(startingProficiencies!.map((x) => x.toJson())),
        "starting_proficiency_options": startingProficiencyOptions?.toJson(),
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
        "language_desc": languageDesc,
        "traits": traits == null
            ? []
            : List<dynamic>.from(traits!.map((x) => x.toJson())),
        "subraces": subraces == null
            ? []
            : List<dynamic>.from(subraces!.map((x) => x.toJson())),
        "url": url,
        "updated_at": updatedAt.toIso8601String(),
      };
}

class StartingProficiencyOptions {
  final String desc;
  final int choose;
  final String type;
  final From from;

  StartingProficiencyOptions({
    required this.desc,
    required this.choose,
    required this.type,
    required this.from,
  });

  factory StartingProficiencyOptions.fromJson(Map<String, dynamic> json) =>
      StartingProficiencyOptions(
        desc: json["desc"],
        choose: json["choose"],
        type: json["type"],
        from: From.fromJson(json["from"]),
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "choose": choose,
        "type": type,
        "from": from.toJson(),
      };
}

class From {
  final String optionSetType;
  final List<Option> options;

  From({
    required this.optionSetType,
    required this.options,
  });

  factory From.fromJson(Map<String, dynamic> json) => From(
        optionSetType: json["option_set_type"],
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "option_set_type": optionSetType,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };
}

class Option {
  final String optionType;
  final Language item;

  Option({
    required this.optionType,
    required this.item,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        optionType: json["option_type"],
        item: Language.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "option_type": optionType,
        "item": item.toJson(),
      };
}
