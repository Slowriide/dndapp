import 'package:dnd_app/domain/entities/dnd/specifics/class.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/class_levels.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/feature.dart';

import 'package:dnd_app/presentation/dnd/class_views/tables/tables.dart';
import 'package:flutter/material.dart';

class ClassDetailsView extends StatelessWidget {
  final Class selectedclass;
  final List<LevelPerClass>? levels;
  final List<Feature>? feature;
  const ClassDetailsView({
    super.key,
    required this.selectedclass,
    required this.levels,
    required this.feature,
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
                      selectedclass.name == 'Fighter'
                          ? _buildTraitRow(
                              'PRIMARY ABILITY',
                              'STR',
                            )
                          : _buildTraitRow(
                              'PRIMARY ABILITY',
                              selectedclass.multiClassing?.prerequisites
                                          .isNotEmpty ==
                                      true
                                  ? selectedclass.multiClassing?.prerequisites
                                          .first.abilityScore?.name ??
                                      'Unknown'
                                  : 'Unknow'),
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
            getTable(selectedclass.name, levels),

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

            //FEATURES
            _FeaturesBuilder(feature: feature, textStyles: textStyles),
            const _MySizedBox(),
            //Class Features
            Text(
              '${selectedclass.name} SUBCLASSES'.toUpperCase(),
              style: textStyles.bodyMedium?.copyWith(color: Colors.amber[800]),
            ),
            const _MySizedBox(),
            const Text(
                'Incididunt est dolor id exercitation incididunt. Duis cupidatat sint est laboris commodo. Irure ex veniam adipisicing eu id consectetur ullamco elit occaecat officia. Magna occaecat id id ea deserunt minim.'),
            const _MySizedBox(),
          ],
        ),
      ],
    );
  }
}

class _FeaturesBuilder extends StatelessWidget {
  const _FeaturesBuilder({
    required this.feature,
    required this.textStyles,
  });

  final List<Feature>? feature;
  final TextTheme textStyles;

  @override
  Widget build(BuildContext context) {
    if (feature == null) {
      return Column(
        children: [
          const SizedBox(height: 25),
          Text('Loading Features...', style: textStyles.titleSmall),
        ],
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feature?.length ?? 3,
      itemBuilder: (context, index) {
        String featuresDesc = '${feature?[index].desc}';
        String cleanedDesc = removeSquareBrackets(featuresDesc);

        return ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                feature?[index].name ?? '',
                style: textStyles.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
          subtitle: Text(
            cleanedDesc,
            style: textStyles.bodyMedium,
          ),
        );
      },
    );
  }

  String removeSquareBrackets(String input) {
    // Expresión regular para eliminar corchetes
    return input.replaceAll(RegExp(r'\[|\]'), '');
  }
}

Widget getTable(String? id, List<LevelPerClass>? levels) {
  switch (id!.toLowerCase()) {
    case 'barbarian':
      return BarbarianFeaturesTable(levels: levels);
    case 'bard':
      return BardFeaturesTable(levels: levels);
    case 'cleric':
      return ClericFeaturesTable(levels: levels);
    case 'druid':
      return DruidFeaturesTable(levels: levels);
    case 'fighter':
      return FighterFeaturesTable(levels: levels);
    case 'monk':
      return MonkFeaturesTable(levels: levels);
    case 'paladin':
      return PaladinFeaturesTable(levels: levels);
    case 'ranger':
      return RangerFeaturesTable(levels: levels);
    case 'rogue':
      return RogueFeaturesTable(levels: levels);
    case 'sorcerer':
      return SorcererFeaturesTable(levels: levels);
    case 'warlock':
      return WarlockFeaturesTable(levels: levels);
    case 'wizard':
      return WizardFeaturesTable(levels: levels);

    default:
      return const SizedBox();
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
