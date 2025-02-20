import 'package:dnd_app/domain/entities/dnd/specifics/race.dart';
import 'package:flutter/material.dart';

class RaceDetailsView extends StatelessWidget {
  final Race race;
  const RaceDetailsView({super.key, required this.race});

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
            //IMAGEN
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/images/races/${race.index}.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const _MySizedBox(),
            //CUADRO CON TEXTO
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Do non fugiat aute laborum officia elit. Eiusmod dolore ea sint non irure eu pariatur fugiat amet voluptate est labore adipisicing nulla. Do incididunt ad anim irure commodo incididunt duis consectetur mollit Lorem id cillum tempor adipisicing. Nisi veniam quis commodo id id anim veniam deserunt ipsum. Ea in consectetur ea ullamco laborum. Id minim incididunt proident deserunt non laboris id aliqua et nulla.',
                    style: textStyles.bodySmall,
                  ),
                  Text(
                    'Do non fugiat aute laborum officia elit. Eiusmod dolore ea sint non irure eu pariatur fugiat amet voluptate est labore adipisicing nulla. Do incididunt ad anim irure commodo incididunt duis consectetur mollit Lorem id cillum tempor adipisicing. Nisi veniam quis commodo id id anim veniam deserunt ipsum. Ea in consectetur ea ullamco laborum. Id minim incididunt proident deserunt non laboris id aliqua et nulla.',
                    style: textStyles.bodySmall,
                  ),
                  const _MySizedBox(),
                  Text(
                    '- Kaladin Strormblessed',
                    style: textStyles.bodySmall!
                        .copyWith(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            const _MySizedBox(height: 40),
            Text(
              'SLENDER AND GRACEFUL',
              style: textStyles.bodyMedium?.copyWith(color: Colors.amber[800]),
            ),
            const _MySizedBox(height: 20),
            Text(
              '''
Irure amet laborum consectetur consequat nostrud. Do qui aute mollit ipsum tempor deserunt ullamco amet pariatur nostrud dolor. Duis mollit labore enim dolor fugiat et esse ipsum ex eiusmod dolor. Nisi irure culpa exercitation elit aute dolor tempor cillum eu do dolor cupidatat.

Dolore Lorem aliqua aliquip Lorem. Dolore duis do id reprehenderit. Dolore proident ipsum fugiat dolore et Lorem sit mollit aliqua.

''',
              style: textStyles.bodySmall,
            ),
            const _MySizedBox(height: 20),
            Text(
              'VARIERTY IN ALL THINGS',
              style: textStyles.bodyMedium?.copyWith(color: Colors.amber[800]),
            ),
            const _MySizedBox(height: 20),
            Text(
              '''
Nostrud voluptate laborum et ad incididunt do incididunt ut est ullamco consequat non. Magna duis do enim ut voluptate officia ullamco tempor exercitation aliquip eiusmod magna. Non dolor ullamco cupidatat reprehenderit occaecat minim enim. Velit quis laborum adipisicing irure elit excepteur esse duis magna consectetur nisi laboris exercitation ut. Consequat non adipisicing aute enim laborum laborum sunt qui enim veniam enim consectetur officia. Officia in nisi in fugiat commodo est Lorem consectetur.

Sit ut veniam aliquip ullamco eiusmod ad fugiat ipsum dolor duis ad occaecat culpa et. Incididunt veniam labore minim exercitation adipisicing incididunt esse consequat. Tempor nisi aliquip enim enim. Dolore proident in commodo duis incididunt tempor anim qui. Eiusmod consectetur do exercitation exercitation aliqua.
''',
              style: textStyles.bodySmall,
            ),

            //NAMES
            Text(
              '${race.name} NAMES AND ETHNICITIES'.toUpperCase(),
              style: textStyles.bodyMedium?.copyWith(color: Colors.amber[800]),
            ),
            const _MySizedBox(height: 20),
            //MALE NAMES
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Male names: ',
                    style: textStyles.bodyMedium,
                  ),
                  TextSpan(
                    text:
                        'Est laboris aliquip laborum incididunt consectetur mollit minim aliquip laboris labore mollit laboris elit velit.',
                    style: textStyles.bodySmall,
                  ),
                ],
              ),
            ),
            const _MySizedBox(height: 20),
            //FEMALE NAMES
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Female names: ',
                    style: textStyles.bodyMedium,
                  ),
                  TextSpan(
                    text:
                        'Anim esse adipisicing consequat dolor duis quis ut deserunt proident voluptate sit culpa et.',
                    style: textStyles.bodySmall,
                  ),
                ],
              ),
            ),
            const _MySizedBox(height: 20),

            //SUBRACES
            Text(
              '${race.name} SUBRACES'.toUpperCase(),
              style: textStyles.bodyMedium?.copyWith(color: Colors.amber[800]),
            ),
            const _MySizedBox(height: 20),
            Text(
              'Chose one of the subraces below or one from another source',
              style: textStyles.bodySmall,
            ),
            const _MySizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //SUBRACE NAME
                  Text(
                    (race.subraces != null && race.subraces!.isNotEmpty)
                        ? race.subraces!.first.name.toUpperCase()
                        : 'No Subrace',
                  ),
                  const _MySizedBox(height: 10),
                  //SUBRACE DESC //TODO
                  Text(
                    'Do non fugiat aute laborum officia elit. Eiusmod dolore ea sint non irure eu pariatur fugiat amet voluptate est labore adipisicing nulla. Do incididunt ad anim irure commodo incididunt duis consectetur mollit Lorem id cillum tempor adipisicing. Nisi veniam quis commodo id id anim veniam deserunt ipsum. Ea in consectetur ea ullamco laborum. Id minim incididunt proident deserunt non laboris id aliqua et nulla.',
                    style: textStyles.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
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
