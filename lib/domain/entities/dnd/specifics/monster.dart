import 'package:dnd_app/data/models/dnd/actions/monster_actions.dart';
import 'package:dnd_app/data/models/dnd/stats/armor_class.dart';
import 'package:dnd_app/data/models/dnd/stats/legendary_action.dart';
import 'package:dnd_app/data/models/dnd/stats/proficency.dart';
import 'package:dnd_app/data/models/dnd/stats/senses.dart';
import 'package:dnd_app/data/models/dnd/stats/special_ability.dart';
import 'package:dnd_app/data/models/dnd/stats/speed.dart';
import 'package:dnd_app/domain/entities/dnd/favoriteable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';

part 'monster.g.dart';

@collection
class Monster implements Favoritable {
  Id? IsarId;
  final String id;
  final String name;
  final String? size;
  final String type;
  final String alignment;
  @ignore
  final List<ArmorClass>? armorClass;
  final int hitPoints;
  final String hitDice;
  final String hitPointsRoll;
  @ignore
  final Speed? speed;
  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;
  @ignore
  final List<dynamic>? damageVulnerabilities;
  @ignore
  final List<dynamic>? damageResistances;
  @ignore
  final List<dynamic>? damageImmunities;
  @ignore
  final List<dynamic>? conditionImmunities;
  @ignore
  final Senses? senses;
  final String languages;
  @ignore
  final num? challengeRating;
  final int proficiencyBonus;
  @ignore
  final num? xp;
  @ignore
  final List<SpecialAbility>? specialAbilities;
  @ignore
  final List<MonsterAction>? actions;
  @ignore
  final List<LegendaryAction>? legendaryActions;
  final String image;
  final String url;
  @ignore
  final List<Proficiency>? proficiencies;

  Monster({
    required this.id,
    required this.name,
    this.size,
    required this.type,
    required this.alignment,
    this.armorClass,
    required this.hitPoints,
    required this.hitDice,
    this.hitPointsRoll = '',
    this.speed,
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
    this.senses,
    required this.languages,
    this.challengeRating,
    required this.proficiencyBonus,
    this.xp,
    this.specialAbilities,
    this.actions,
    this.legendaryActions,
    required this.image,
    required this.url,
    this.proficiencies,
  });

  @override
  String get displayId => id;

  @override
  String get displayName => name;
  @override
  String get imageUrl => image;
  @override
  String get navigatePath => '/home/0/api/2014/monsters/$id';
}

String armorClassText(Monster monster) {
  if (monster.armorClass!.isEmpty) {
    return "Sin información de clase de armadura.";
  }

  return monster.armorClass!
      .map((ac) =>
          "${ac.value} (${ac.type})") // Convertir cada ArmorClass en un texto
      .join(", "); // Combinar en una sola cadena separada por comas
}

String speedText(Speed? speed) {
  // Crear una lista de las velocidades disponibles (ignorando las nulas)
  List<String> velocidades = [];

  if (speed?.walk != null) velocidades.add("Walk: ${speed?.walk}");
  if (speed?.burrow != null) velocidades.add("Burrow: ${speed?.burrow}");
  if (speed?.fly != null) velocidades.add("Fly: ${speed?.fly}");
  if (speed?.swim != null) velocidades.add("Swim: ${speed?.swim}");

  // Combinar la lista en un solo texto separado por comas
  return velocidades.isNotEmpty
      ? velocidades.join(", ")
      : "No speed information available.";
}

String proficiencyText(List<Proficiency>? proficiencies) {
  if (proficiencies == null || proficiencies.isEmpty) {
    return 'No proficiencies available';
    // Handle null or empty list
  }

  final savingThrows = proficiencies
      .where((p) => p.proficiency?.name.startsWith("Saving Throw") ?? false);

  final savingThrowsText = savingThrows.map((p) {
    final parts = p.proficiency?.name
        .split(": "); // Separa "Saving Throw: CON" en ["Saving Throw", "CON"]
    return '${parts?.last} ${p.value}'; // Formatea como "CON 6"
  }).join(', '); // Une los elementos con comas

  return 'Saving Throw: $savingThrowsText';
}

List<Widget> skillsWidgets(
    BuildContext context, List<Proficiency>? proficiencies) {
  final textStyles = Theme.of(context).textTheme;
  if (proficiencies == null || proficiencies.isEmpty) {
    return [
      const Text('No proficiencies available'),
    ]; // Handle null or empty list
  }

  final skills = proficiencies
      .where((p) => p.proficiency?.name.startsWith("Skill") ?? false);

  return skills.map((p) {
    final parts = p.proficiency?.name.split(': ');
    final skillName = parts?.last;
    final skillUrl = '/${skillName?.toLowerCase()}';

    return Row(
      children: [
        GestureDetector(
          onTap: () => context.push(skillUrl),
          child: Text(
            '$skillName ',
            style: textStyles.bodyMedium!.copyWith(
                color: Colors.blue, decoration: TextDecoration.underline),
          ),
        ),
        Text('+${p.value} ', style: textStyles.bodyMedium)
      ],
    );
  }).toList();
}

List<Widget> sensesWidget(BuildContext context, Senses? senses) {
  final textStyles = Theme.of(context).textTheme;
  List<Widget> senseWidgets = [];

  if (senses!.blindsight != null && senses.blindsight!.isNotEmpty) {
    senseWidgets.add(Row(
      children: [
        GestureDetector(
          onTap: () => context.push('/blindsight'),
          child: Text(
            'Blindsight',
            style: textStyles.bodyMedium!.copyWith(
                color: Colors.blue, decoration: TextDecoration.underline),
          ),
        ),
        Text(' ${senses.blindsight}, ', style: textStyles.bodySmall),
      ],
    ));
  }
  if (senses.darkvision != null && senses.darkvision!.isNotEmpty) {
    senseWidgets.add(
      Row(
        children: [
          GestureDetector(
            onTap: () => context.push('/darkvision'),
            child: Text(
              'Darkvision',
              style: textStyles.bodyMedium!.copyWith(
                  color: Colors.blue, decoration: TextDecoration.underline),
            ),
          ),
          Text(' ${senses.darkvision}, ', style: textStyles.bodySmall),
        ],
      ),
    );
  }

  senseWidgets.add(
    Text(
      'Pasive Perception: ${senses.passivePerception}',
      style: textStyles.bodySmall,
    ),
  );
  return senseWidgets;
}

List<Widget> specialAbilitiesText(
    BuildContext context, List<SpecialAbility>? abilities) {
  final textStyles = Theme.of(context).textTheme;
  if (abilities == null || abilities.isEmpty) {
    return [
      Text('No Special abilities available', style: textStyles.bodyMedium)
    ];
  }

  return abilities.map((ability) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${ability.name}. ',
                style: textStyles.bodyMedium!
                    .copyWith(fontStyle: FontStyle.italic),
              ),
              TextSpan(
                text: ability.desc,
                style: textStyles.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(height: 5)
      ],
    );
  }).toList();
}

List<Widget> monsterActions(BuildContext context, List<MonsterAction> actions) {
  final textStyles = Theme.of(context).textTheme;
  if (actions.isEmpty) {
    return [Text('No actions available', style: textStyles.bodyMedium)];
  }

  return actions.map((action) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${action.name}. ',
                style: textStyles.bodyMedium!
                    .copyWith(fontStyle: FontStyle.italic),
              ),
              TextSpan(
                text: action.desc,
                style: textStyles.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }).toList();
}

List<Widget> legendaryActionsText(
    BuildContext context, List<LegendaryAction>? action) {
  final textStyles = Theme.of(context).textTheme;
  if (action == null || action.isEmpty) {
    return [
      Text('No Special abilities available', style: textStyles.bodyMedium)
    ];
  }

  return action.map((action) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${action.name}. ',
                style: textStyles.bodyMedium!
                    .copyWith(fontStyle: FontStyle.italic),
              ),
              TextSpan(
                text: action.desc,
                style: textStyles.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }).toList();
}
