import 'package:dnd_app/data/models/dnd/damage/spell_damage.dart';
import 'package:dnd_app/data/models/dnd/spells/school.dart';
import 'package:dnd_app/domain/entities/dnd/favoriteable.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'spell.g.dart';

@collection
class Spell implements Favoritable {
  Id? isarId;
  final String index;
  final String name;

  final List<String> desc;
  @ignore
  final List<String>? higherLevel;
  @ignore
  final String? range;
  @ignore
  final List<String>? components;
  @ignore
  final String? material;
  @ignore
  final bool? ritual;
  @ignore
  final String? duration;
  @ignore
  final bool? concentration;
  @ignore
  final String? castingTime;
  @ignore
  final int? level;
  @ignore
  final String? attackType;
  @ignore
  final SpellDamage? damage;
  @ignore
  final School? school;
  @ignore
  final List<School>? classes;
  @ignore
  final List<School>? subclasses;
  final String url;
  final DateTime updatedAt;

  Spell({
    required this.index,
    required this.name,
    required this.desc,
    this.higherLevel,
    this.range,
    this.components,
    this.material,
    this.ritual,
    this.duration,
    this.concentration,
    this.castingTime,
    this.level,
    this.attackType,
    this.damage,
    this.school,
    this.classes,
    this.subclasses,
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
  String get navigatePath => '/home/0/api/2014/spells/$index';
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
