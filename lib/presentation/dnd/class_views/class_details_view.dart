import 'package:dnd_app/domain/entities/dnd/specifics/class.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/class_levels.dart';
import 'package:dnd_app/presentation/dnd/class_views/tables/barbarian_table.dart';
import 'package:flutter/material.dart';

class ClassDetailsView extends StatelessWidget {
  final Class selectedclass;
  final List<LevelPerClass>? levels;
  const ClassDetailsView({
    super.key,
    required this.selectedclass,
    required this.levels,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TRAITS
            Text('Core ${selectedclass.name}'),
            const _MySizedBox(),

            //CORE TRAITS
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTraitRow(
                        'PRIMARY ABILITY',
                        selectedclass.multiClassing?.prerequisites.first
                                .abilityScore?.name ??
                            'Unknown',
                      ),
                      const _CustomDivider(),
                      _buildTraitRow(
                        'HIT POINT DIE',
                        '${selectedclass.hitDie.toString()} per ${selectedclass.name} level',
                      ),
                      const _CustomDivider(),
                      _buildTraitRow(
                        'SAVING THROW',
                        selectedclass.savingThrows!
                            .map((e) => e.name)
                            .join(' and '),
                      ),
                      const _CustomDivider(),
                      _buildTraitRow(
                        'SKILL PROFICIENCIES',
                        selectedclass.proficiencyChoices!.first.desc,
                      ),
                      const _CustomDivider(),
                      _buildTraitRow(
                        'WEAPON PROFICIENCIES',
                        getFilteredProficiencyNames(
                            selectedclass.proficiencies),
                      ),
                      const _CustomDivider(),
                      _buildTraitRow(
                        'ARMOR TRAINING',
                        getFilteredProficencyArmors(
                            selectedclass.proficiencies),
                      ),
                      const _CustomDivider(),
                      _buildTraitRow(
                        'STARTING EQUIPMENT',
                        'Choose ${selectedclass.startingEquipmentOptions!.first.choose} of: ${selectedclass.startingEquipmentOptions!.first.desc}',
                      ),
                      const _CustomDivider(),
                    ],
                  ),
                ],
              ),
            ),
            const _MySizedBox(),

            Text(
              'Lorem commodo eiusmod est deserunt dolor excepteur ullamco anim consectetur et commodo ipsum ipsum occaecat. Sunt sint eiusmod labore reprehenderit laboris irure incididunt enim proident aliquip. Laboris dolor ea aliqua consequat aliqua Lorem laborum laborum consectetur excepteur fugiat et laborum veniam.',
              style: textStyles.bodySmall,
            ),
            const _MySizedBox(),

            Text(
              'Lorem commodo eiusmod est deserunt dolor excepteur ullamco anim consectetur et commodo ipsum ipsum occaecat. Sunt sint eiusmod labore reprehenderit laboris irure incididunt enim proident aliquip. Laboris dolor ea aliqua consequat aliqua Lorem laborum laborum consectetur excepteur fugiat et laborum veniam.',
              style: textStyles.bodySmall,
            ),
            const _MySizedBox(),

            Text(
              'Lorem commodo eiusmod est deserunt dolor excepteur ullamco anim consectetur et commodo ipsum ipsum occaecat. Sunt sint eiusmod labore reprehenderit laboris irure incididunt enim proident aliquip. Laboris dolor ea aliqua consequat aliqua Lorem laborum laborum consectetur excepteur fugiat et laborum veniam.',
              style: textStyles.bodySmall,
            ),
            const _MySizedBox(),

            Text('Becoming a ${selectedclass.name}...',
                style: textStyles.bodyMedium),

            //AS A LEVEL 1 CHARACTER
            _LevelOneCharacter(
              textStyles: textStyles,
              selectedclass: selectedclass,
            ),

            //As a Multiclass Character
            _MulticlassCharacter(
              textStyles: textStyles,
              selectedclass: selectedclass,
            ),

            //Table
            BarbarianFeaturesTable(levels: levels),

            const _MySizedBox(),

            //Class Features
            Text(
              '${selectedclass.name} CLASS FEATURES'.toUpperCase(),
              style: textStyles.bodyMedium?.copyWith(color: Colors.amber[800]),
            ),
            const _MySizedBox(),
            Text(
              'As a ${selectedclass.name}, you gain the following class features when you reach the specified ${selectedclass.name} levels. These features are listed in the ${selectedclass.name} Feaures table',
              style: textStyles.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}

class _LevelOneCharacter extends StatelessWidget {
  const _LevelOneCharacter({
    required this.textStyles,
    required this.selectedclass,
  });

  final TextTheme textStyles;
  final Class selectedclass;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _MySizedBox(),
        Text('As a Level 1 Character', style: textStyles.titleSmall),
        const _MySizedBox(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _RedDot(),
            Expanded(
              child: Text(
                'Gain all the traits in the Core ${selectedclass.name} Traits table.',
                style: textStyles.bodySmall,
              ),
            ),
          ],
        ),
        const _MySizedBox(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _RedDot(),
            Expanded(
              child: Text(
                'Gain the ${selectedclass.name} level 1 features, which are listed in the ${selectedclass.name} Features table.',
                style: textStyles.bodySmall,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//TODO!
class _MulticlassCharacter extends StatelessWidget {
  const _MulticlassCharacter({
    required this.textStyles,
    required this.selectedclass,
  });

  final TextTheme textStyles;
  final Class selectedclass;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _MySizedBox(),
        Text('As a Level 1 Character', style: textStyles.titleSmall),
        const _MySizedBox(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _RedDot(),
            Expanded(
              child: Text(
                'Gain all the traits in the Core ${selectedclass.name} Traits table.',
                style: textStyles.bodySmall,
              ),
            ),
          ],
        ),
        const _MySizedBox(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _RedDot(),
            Expanded(
              child: Text(
                'Gain the ${selectedclass.name} level 1 features, which are listed in the ${selectedclass.name} Features table.',
                style: textStyles.bodySmall,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _RedDot extends StatelessWidget {
  const _RedDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, top: 6.7),
      height: 5,
      width: 5,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
    );
  }
}

// ignore: unused_element
class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color.fromARGB(187, 109, 109, 109),
    );
  }
}

class _MySizedBox extends StatelessWidget {
  final double? height;
  // ignore: unused_element
  const _MySizedBox({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height ?? 17);
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: 500,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(187, 109, 109, 109),
          ),
        ),
      ),
    );
  }
}

Widget _buildTraitRow(String title, String value) {
  return Column(
    children: [
      const SizedBox(height: 15),
      Row(
        children: [
          SizedBox(
            width: 200,
            child: Text(
              title,
              style: const TextStyle(color: Color.fromARGB(255, 105, 105, 105)),
            ),
          ),
          Text(value),
        ],
      ),
    ],
  );
}
