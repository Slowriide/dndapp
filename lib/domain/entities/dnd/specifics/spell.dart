import 'package:dnd_app/data/models/dnd/damage/spell_damage.dart';
import 'package:dnd_app/data/models/dnd/spells/school.dart';
import 'package:flutter/material.dart';

class Spell {
  final String index;
  final String name;
  final List<String> desc;
  final List<String> higherLevel;
  final String range;
  final List<String> components;
  final String material;
  final bool ritual;
  final String duration;
  final bool concentration;
  final String castingTime;
  final int? level;
  final String attackType;
  final SpellDamage? damage;
  final School school;
  final List<School> classes;
  final List<School> subclasses;
  final String url;
  final DateTime updatedAt;

  Spell({
    required this.index,
    required this.name,
    required this.desc,
    required this.higherLevel,
    required this.range,
    required this.components,
    required this.material,
    required this.ritual,
    required this.duration,
    required this.concentration,
    required this.castingTime,
    required this.level,
    required this.attackType,
    required this.damage,
    required this.school,
    required this.classes,
    required this.subclasses,
    required this.url,
    required this.updatedAt,
  });
}

Widget componentsText(
    BuildContext context, List<String> components, String material) {
  final textStyles = Theme.of(context).textTheme;

  if (components.isEmpty) {
    return Text('No description available', style: textStyles.bodyMedium);
  }

  return Row(
    children: [
      Expanded(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Components: ${components.join(', ')} ',
                style: textStyles.bodyMedium,
              ),
              TextSpan(
                text: material.isNotEmpty
                    ? '($material)'
                    : 'No materials required',
                style: textStyles.bodySmall,
              ),
            ],
          ),
          softWrap: true,
        ),
      ),
    ],
  );
}

Widget higherLevelsText(BuildContext context, List<String> higherLevels) {
  final textStyles = Theme.of(context).textTheme;

  if (higherLevels.isEmpty) {
    return Text('', style: textStyles.bodyMedium);
  }

  return Row(
    children: [
      Expanded(
        child: Text.rich(
          TextSpan(children: [
            TextSpan(
              text: 'At higher levels: ',
              style: textStyles.bodyMedium!.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
            TextSpan(
              text: higherLevels.join(''),
              style: textStyles.bodyMedium,
            ),
          ]),
        ),
      )
    ],
  );
}

List<Widget> classesText(BuildContext context, List<School> classes) {
  final textStyles = Theme.of(context).textTheme;

  if (classes.isEmpty) {
    return [Text('', style: textStyles.bodyMedium)];
  }

  return [
    RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Classes: ',
            style: textStyles.bodyMedium!.copyWith(fontStyle: FontStyle.italic),
          ),
          TextSpan(
            text: classes.map((c) => c.name).join(
                ', '), // Obtén los nombres de las clases y únelos con coma
            style: textStyles.bodySmall,
          ),
        ],
      ),
    ),
    const SizedBox(height: 5),
  ];
}
