import 'package:dnd_app/data/models/dnd/damage/dc_type_class.dart';
import 'package:dnd_app/data/models/dnd/stats/armor_class.dart';
import 'package:dnd_app/data/models/dnd/stats/senses.dart';
import 'package:dnd_app/data/models/dnd/stats/special_ability.dart';
import 'package:dnd_app/data/models/dnd/stats/speed.dart';

import 'actions/monster_actions.dart';
import 'stats/legendary_action.dart';

class MonsterDetails {
  final String id;
  final String name;
  final String size;
  final String type;
  final String alignment;
  final List<ArmorClass> armorClass;
  final int hitPoints;
  final String hitDice;
  final String hitPointsRoll;
  final Speed speed;
  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;
  final List<ProficiencyElement>? proficiencies;
  final List<dynamic>? damageVulnerabilities;
  final List<dynamic>? damageResistances;
  final List<String>? damageImmunities;
  final List<dynamic>? conditionImmunities;
  final Senses senses;
  final String languages;
  final num challengeRating;
  final int proficiencyBonus;
  final num xp;
  final List<SpecialAbility>? specialAbilities;
  final List<MonsterAction> actions;
  final List<LegendaryAction>? legendaryActions;
  final String image;
  final String url;
  final DateTime updatedAt;

  MonsterDetails({
    required this.id,
    required this.name,
    required this.size,
    required this.type,
    required this.alignment,
    required this.armorClass,
    required this.hitPoints,
    required this.hitDice,
    required this.hitPointsRoll,
    required this.speed,
    required this.strength,
    required this.dexterity,
    required this.constitution,
    required this.intelligence,
    required this.wisdom,
    required this.charisma,
    required this.proficiencies,
    this.damageVulnerabilities,
    this.damageResistances,
    this.damageImmunities,
    this.conditionImmunities,
    required this.senses,
    required this.languages,
    required this.challengeRating,
    required this.proficiencyBonus,
    required this.xp,
    this.specialAbilities,
    required this.actions,
    this.legendaryActions,
    required this.image,
    required this.url,
    required this.updatedAt,
  });

  factory MonsterDetails.fromJson(Map<String, dynamic> json) => MonsterDetails(
        id: json["index"] ?? '',
        name: json["name"] ?? '',
        size: json["size"] ?? '',
        type: json["type"] ?? '',
        alignment: json["alignment"] ?? '',
        armorClass: json["armor_class"] != null
            ? List<ArmorClass>.from(
                json["armor_class"].map((x) => ArmorClass.fromJson(x)))
            : [],
        hitPoints: json["hit_points"] ?? 0,
        hitDice: json["hit_dice"] ?? '',
        hitPointsRoll: json["hit_points_roll"] ?? '',
        speed: json["speed"] != null
            ? Speed.fromJson(json["speed"])
            : Speed.defaultSpeed(),
        strength: json["strength"] ?? 0,
        dexterity: json["dexterity"] ?? 0,
        constitution: json["constitution"] ?? 0,
        intelligence: json["intelligence"] ?? 0,
        wisdom: json["wisdom"] ?? 0,
        charisma: json["charisma"] ?? 0,
        proficiencies: json["proficiencies"] != null
            ? List<ProficiencyElement>.from(json["proficiencies"]
                .map((x) => ProficiencyElement.fromJson(x)))
            : [],
        damageVulnerabilities: json["damage_vulnerabilities"] != null
            ? List<dynamic>.from(json["damage_vulnerabilities"].map((x) => x))
            : [],
        damageResistances: json["damage_resistances"] != null
            ? List<dynamic>.from(json["damage_resistances"].map((x) => x))
            : [],
        damageImmunities: json["damage_immunities"] != null
            ? List<String>.from(json["damage_immunities"].map((x) => x))
            : [],
        conditionImmunities: json["condition_immunities"] != null
            ? List<dynamic>.from(json["condition_immunities"].map((x) => x))
            : [],
        senses: Senses.fromJson(json["senses"]),
        languages: json["languages"] ?? '',
        challengeRating: (json["challenge_rating"] is int)
            ? json["challenge_rating"]
            : (json["challenge_rating"] as num).toDouble(),
        proficiencyBonus: json["proficiency_bonus"] ?? 0.0,
        xp: (json["xp"] is int) ? json["xp"] : (json["xp"] as num).toInt(),
        specialAbilities: json["special_abilities"] != null
            ? List<SpecialAbility>.from(json["special_abilities"]
                .map((x) => SpecialAbility.fromJson(x)))
            : [],
        actions: json["actions"] != null
            ? List<MonsterAction>.from(
                json["actions"].map((x) => MonsterAction.fromJson(x)))
            : [],
        legendaryActions: json["legendary_actions"] != null
            ? List<LegendaryAction>.from(json["legendary_actions"]
                .map((x) => LegendaryAction.fromJson(x)))
            : [],
        image: json["image"] ?? '',
        url: json["url"] ?? '',
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "index": id,
        "name": name,
        "size": size,
        "type": type,
        "alignment": alignment,
        "armor_class": List<dynamic>.from(armorClass.map((x) => x.toJson())),
        "hit_points": hitPoints,
        "hit_dice": hitDice,
        "hit_points_roll": hitPointsRoll,
        "speed": speed.toJson(),
        "strength": strength,
        "dexterity": dexterity,
        "constitution": constitution,
        "intelligence": intelligence,
        "wisdom": wisdom,
        "charisma": charisma,
        "proficiencies": proficiencies == null
            ? null
            : List<dynamic>.from(proficiencies!.map((x) => x.toJson())),
        "damage_vulnerabilities": damageVulnerabilities == null
            ? null
            : List<dynamic>.from(damageVulnerabilities!.map((x) => x)),
        "damage_resistances": damageResistances == null
            ? null
            : List<dynamic>.from(damageResistances!.map((x) => x)),
        "damage_immunities": damageImmunities == null
            ? null
            : List<dynamic>.from(damageImmunities!.map((x) => x)),
        "condition_immunities": conditionImmunities == null
            ? null
            : List<dynamic>.from(conditionImmunities!.map((x) => x)),
        "senses": senses.toJson(),
        "languages": languages,
        "challenge_rating": challengeRating,
        "proficiency_bonus": proficiencyBonus,
        "xp": xp,
        "special_abilities": specialAbilities == null
            ? null
            : List<dynamic>.from(specialAbilities!.map((x) => x.toJson())),
        "actions": List<dynamic>.from(actions.map((x) => x.toJson())),
        "legendary_actions": legendaryActions == null
            ? null
            : List<dynamic>.from(legendaryActions!.map((x) => x.toJson())),
        "image": image,
        "url": url,
        "updated_at": updatedAt.toIso8601String(),
      };
}

class ProficiencyElement {
  final int value;
  final DcTypeClass proficiency;

  ProficiencyElement({
    required this.value,
    required this.proficiency,
  });

  factory ProficiencyElement.fromJson(Map<String, dynamic> json) =>
      ProficiencyElement(
        value: json["value"],
        proficiency: DcTypeClass.fromJson(json["proficiency"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "proficiency": proficiency.toJson(),
      };
}

class SpecialAbilityUsage {
  final String type;
  final int times;
  final List<dynamic> restTypes;

  SpecialAbilityUsage({
    required this.type,
    required this.times,
    required this.restTypes,
  });

  factory SpecialAbilityUsage.fromJson(Map<String, dynamic> json) =>
      SpecialAbilityUsage(
        type: json["type"],
        times: json["times"],
        restTypes: List<dynamic>.from(json["rest_types"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "times": times,
        "rest_types": List<dynamic>.from(restTypes.map((x) => x)),
      };
}
