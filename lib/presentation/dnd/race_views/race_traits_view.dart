import 'package:dnd_app/common/utils/brackets_remover.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/race.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/race_traits.dart';
import 'package:flutter/material.dart';

class RaceTraitsView extends StatelessWidget {
  final Race? race;
  final List<RaceTrait>? raceTraits;
  const RaceTraitsView({super.key, required this.raceTraits, this.race});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //ABILITY SCORE
            Text('Ability Score Increase', style: textStyles.bodyMedium),
            const _MySizedBox(),

            race!.name == 'Human'
                ? Text(
                    'Your ability scores each increase by 1.',
                    style: textStyles.bodySmall,
                  )
                : Text(
                    race!.abilityBonuses != null &&
                            race!.abilityBonuses!.isNotEmpty
                        ? race!.abilityBonuses!
                            .map((bonus) =>
                                'Your ${bonus.abilityScore.name} score increases by ${bonus.bonus}.')
                            .join(', ')
                        : 'No ability bonuses',
                    style: textStyles.bodySmall,
                  ),
            const _MySizedBox(),

            //AGE
            Text('Age', style: textStyles.bodyMedium),
            const _MySizedBox(),
            Text(race?.age ?? 'No info', style: textStyles.bodySmall),

            //TRAITS
            _TraitsBuilder(
              traits: raceTraits,
              textStyles: textStyles,
            ),
            const _MySizedBox(),

            //Languages
            Text('Languages', style: textStyles.bodyMedium),
            const _MySizedBox(),
            Text(race?.languageDesc ?? 'No info', style: textStyles.bodySmall),
            const _MySizedBox(),
            //SIZE
            Text('Size', style: textStyles.bodyMedium),
            const _MySizedBox(),
            Text(race?.sizeDescription ?? 'No info',
                style: textStyles.bodySmall),
            const _MySizedBox(),
            //SPEED
            Text('Speed', style: textStyles.bodyMedium),
            const _MySizedBox(),
            Text('Your base walking speed is ${race?.speed.toString()} feet.',
                style: textStyles.bodySmall),
            const _MySizedBox(),
          ],
        )
      ],
    );
  }
}

class _TraitsBuilder extends StatelessWidget {
  final List<RaceTrait>? traits;
  final TextTheme textStyles;

  const _TraitsBuilder({
    required this.traits,
    required this.textStyles,
  });

  @override
  Widget build(BuildContext context) {
    if (traits == null) {
      return Column(
        children: [
          const SizedBox(height: 25),
          Text('Loading Traits...', style: textStyles.titleSmall),
        ],
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: traits!.length,
      itemBuilder: (context, index) {
        String featuresDesc = '${traits?[index].desc}';
        String cleanedDesc = removeSquareBrackets(featuresDesc);
        return ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(traits![index].name ?? '', style: textStyles.bodyMedium),
              const SizedBox(height: 20),
              Text(
                cleanedDesc,
                style: textStyles.bodySmall,
              ),
            ],
          ),
        );
      },
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
