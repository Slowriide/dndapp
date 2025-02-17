import 'package:dnd_app/domain/entities/dnd/specifics/spell.dart';
import 'package:dnd_app/presentation/providers/spell_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpellScreen extends ConsumerStatefulWidget {
  final String spellId;
  const SpellScreen({super.key, required this.spellId});

  @override
  SpellScreenState createState() => SpellScreenState();
}

class SpellScreenState extends ConsumerState<SpellScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(spellInfoProvider.notifier).loadSpell(widget.spellId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final Spell? spell = ref.watch(spellInfoProvider)[widget.spellId];

    if (spell == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _Appbar(spell: spell, textStyles: textStyles),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //LEVEL AND SCHOOL

                  Text(
                      '${spell.level}${getOrdinalSuffix(spell.level)} Level ${spell.school.name}'),

                  const _MySizedBox(),
                  const _Divider(),
                  const _MySizedBox(),

                  // CASTING
                  Row(
                    children: [
                      Text('Casting Time: ', style: textStyles.bodyMedium),
                      Text(spell.castingTime, style: textStyles.bodySmall),
                    ],
                  ),
                  const _MySizedBox(),

                  // RANGE
                  Row(
                    children: [
                      Text('Rangue/Area: ', style: textStyles.bodyMedium),
                      Text(spell.range, style: textStyles.bodySmall),
                    ],
                  ),
                  const _MySizedBox(),

                  // COMPONENTS
                  componentsText(context, spell.components, spell.material),
                  const _MySizedBox(),

                  //DURATION
                  Row(
                    children: [
                      Text('Duration: ', style: textStyles.bodyMedium),
                      Text(spell.duration, style: textStyles.bodySmall),
                    ],
                  ),

                  const _MySizedBox(),
                  const _Divider(),
                  const _MySizedBox(),

                  //DESCRIPTION
                  Text(spell.desc.join(''), style: textStyles.bodyMedium),
                  const _MySizedBox(),

                  //HIGHER LEVELS
                  higherLevelsText(context, spell.higherLevel),
                  const _MySizedBox(),
                  const _Divider(),
                  const _MySizedBox(),

                  //CLASSES
                  ...classesText(context, spell.classes),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String getOrdinalSuffix(int? number) {
  switch (number) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}

class _Appbar extends StatelessWidget {
  const _Appbar({
    required this.spell,
    required this.textStyles,
  });

  final Spell? spell;
  final TextTheme textStyles;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 75,
      floating: false,
      pinned: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      title: Row(
        children: [
          Text(spell!.name, style: textStyles.bodyMedium),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_border_sharp,
              size: 30,
              color: Color.fromARGB(187, 124, 90, 245),
            ),
          )
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Divider(color: Color.fromARGB(187, 124, 90, 245));
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
