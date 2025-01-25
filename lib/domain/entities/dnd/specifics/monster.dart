import 'package:dartz/dartz.dart';
import 'package:dnd_app/data/models/dnd/actions/monster_actions.dart';

import 'package:dnd_app/data/models/dnd/stats/armor_class.dart';
import 'package:dnd_app/data/models/dnd/stats/legendary_action.dart';
import 'package:dnd_app/data/models/dnd/stats/senses.dart';
import 'package:dnd_app/data/models/dnd/stats/special_ability.dart';
import 'package:dnd_app/data/models/dnd/stats/speed.dart';

class Monster {
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
  final List<dynamic>? damageVulnerabilities;
  final List<dynamic>? damageResistances;
  final List<dynamic>? damageImmunities;
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

  Monster({
    required this.id,
    required this.name,
    required this.size,
    required this.type,
    required this.alignment,
    required this.armorClass,
    required this.hitPoints,
    required this.hitDice,
    this.hitPointsRoll = '',
    required this.speed,
    required this.strength,
    required this.dexterity,
    required this.constitution,
    required this.intelligence,
    required this.wisdom,
    required this.charisma,
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
  });
}
