import 'package:dnd_app/common/widgets/basic_rules_mark.dart';
import 'package:dnd_app/common/widgets/general/my_sized_box.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';
import 'package:flutter/material.dart';

class MonsterStats extends StatelessWidget {
  const MonsterStats({
    super.key,
    required this.monster,
  });

  final Monster? monster;

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Size, Type, Alignment
            Text(
              '${monster!.size} ${monster!.type}, ${monster!.alignment} ',
              style: textStyles.bodySmall,
            ),
            const MySizedBox(),

            const _Divider(),

            const MySizedBox(),

            //Armor Class
            Row(
              children: [
                Text('Armor Class: ', style: textStyles.bodyMedium),
                Text(armorClassText(monster!), style: textStyles.bodySmall),
              ],
            ),

            const MySizedBox(),

            //Hit Points
            Row(
              children: [
                Text('Hit Points: ', style: textStyles.bodyMedium),
                Text(
                    '${monster!.hitPoints.toString()} (${monster!.hitPointsRoll})',
                    style: textStyles.bodySmall),
              ],
            ),

            const MySizedBox(),

            //Speed
            Row(
              children: [
                Text('Speed: ', style: textStyles.bodyMedium),
                Text(speedText(monster!.speed), style: textStyles.bodySmall),
              ],
            ),

            const MySizedBox(),
            const _Divider(),
            const MySizedBox(height: 25),

            _Stats(textStyles: textStyles, monster: monster),

            const MySizedBox(height: 25),
            const _Divider(),
            const MySizedBox(),
            Text(proficiencyText(monster!.proficiencies)),
            const MySizedBox(),
            Row(
              children: [
                Text('Skills: ', style: textStyles.bodyMedium),
                ...skillsWidgets(context, monster!.proficiencies),
              ],
            ),
            const MySizedBox(),
            Wrap(
              children: [
                Text('senses: ', style: textStyles.bodyMedium),
                ...sensesWidget(context, monster!.senses),
              ],
            ),
            const MySizedBox(),
            Row(
              children: [
                Text('Lenguages: ', style: textStyles.bodyMedium),
                Text(monster!.languages, style: textStyles.bodySmall),
              ],
            ),
            const MySizedBox(),
            Row(
              children: [
                Text('Challenge: ', style: textStyles.bodyMedium),
                Text(monster!.challengeRating.toString(),
                    style: textStyles.bodySmall),
                Text(' (${monster!.xp.toString()} XP)',
                    style: textStyles.bodySmall),
              ],
            ),
            const MySizedBox(),
            const _Divider(),
            const MySizedBox(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  specialAbilitiesText(context, monster!.specialAbilities),
            ),

            const MySizedBox(),

            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                monster!.image.replaceAll(' ', ''),
                fit: BoxFit.cover,
              ),
            ),
            const MySizedBox(height: 30),
            const BasicRulesMark(),
          ],
        ),
      ],
    );
  }
}

class _Stats extends StatelessWidget {
  const _Stats({
    required this.textStyles,
    required this.monster,
  });

  final TextTheme textStyles;
  final Monster? monster;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text('STR', style: textStyles.titleSmall),
                Text(
                  monster!.strength.toString(),
                  style: textStyles.titleSmall!.copyWith(
                    color: const Color.fromARGB(255, 167, 167, 167),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text('DEX', style: textStyles.titleSmall),
                Text(
                  monster!.dexterity.toString(),
                  style: textStyles.titleSmall!.copyWith(
                    color: const Color.fromARGB(255, 167, 167, 167),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text('CON', style: textStyles.titleSmall),
                Text(
                  monster!.constitution.toString(),
                  style: textStyles.titleSmall!.copyWith(
                    color: const Color.fromARGB(255, 167, 167, 167),
                  ),
                ),
              ],
            ),
          ],
        ),
        const MySizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text('INT', style: textStyles.titleSmall),
                Text(
                  monster!.intelligence.toString(),
                  style: textStyles.titleSmall!.copyWith(
                    color: const Color.fromARGB(255, 167, 167, 167),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text('WIS', style: textStyles.titleSmall),
                Text(
                  monster!.wisdom.toString(),
                  style: textStyles.titleSmall!.copyWith(
                    color: const Color.fromARGB(255, 167, 167, 167),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text('CHA', style: textStyles.titleSmall),
                Text(
                  monster!.charisma.toString(),
                  style: textStyles.titleSmall!.copyWith(
                    color: const Color.fromARGB(255, 167, 167, 167),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Divider(color: Color.fromARGB(188, 243, 106, 97));
  }
}
