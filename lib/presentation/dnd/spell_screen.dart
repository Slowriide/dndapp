import 'package:dnd_app/common/widgets/basic_rules_mark.dart';
import 'package:dnd_app/common/widgets/general/my_sized_box.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/spell.dart';
import 'package:dnd_app/presentation/providers/db/favorite_spells_provider.dart';
import 'package:dnd_app/presentation/providers/db/local_storage_provider.dart';
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
                      '${spell.level}${getOrdinalSuffix(spell.level)} Level ${spell.school!.name}'),

                  const MySizedBox(),
                  const _Divider(),
                  const MySizedBox(),

                  // CASTING
                  Row(
                    children: [
                      Text('Casting Time: ', style: textStyles.bodyMedium),
                      Text(spell.castingTime ?? '',
                          style: textStyles.bodySmall),
                    ],
                  ),
                  const MySizedBox(),

                  // RANGE
                  Row(
                    children: [
                      Text('Rangue/Area: ', style: textStyles.bodyMedium),
                      Text(spell.range ?? '', style: textStyles.bodySmall),
                    ],
                  ),
                  const MySizedBox(),

                  // COMPONENTS
                  componentsText(
                      context, spell.components!, spell.material ?? ''),
                  const MySizedBox(),

                  //DURATION
                  Row(
                    children: [
                      Text('Duration: ', style: textStyles.bodyMedium),
                      Text(spell.duration ?? '', style: textStyles.bodySmall),
                    ],
                  ),

                  const MySizedBox(),
                  const _Divider(),
                  const MySizedBox(),

                  //DESCRIPTION
                  Text(spell.desc.join(''), style: textStyles.bodyMedium),
                  const MySizedBox(),

                  //HIGHER LEVELS
                  higherLevelsText(context, spell.higherLevel!),
                  const MySizedBox(),
                  const _Divider(),
                  const MySizedBox(),

                  //CLASSES
                  ...classesText(context, spell.classes!),
                  const MySizedBox(height: 30),
                  const BasicRulesMark(),
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

final isFavProvider = FutureProvider.family.autoDispose((ref, String spellId) {
  final localStorageRepository = ref.watch(spellsStorageRepositoryProvider);

  return localStorageRepository.isSpellFavorite(spellId);
});

class _Appbar extends ConsumerWidget {
  const _Appbar({
    required this.spell,
    required this.textStyles,
  });

  final Spell? spell;
  final TextTheme textStyles;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavFuture = ref.watch(isFavProvider(spell!.index));
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
              onPressed: () async {
                // ref
                //     .read(LocalStorageRepositoryProvider)
                //     .toggleFavorite(monster!);
                await ref
                    .read(favoriteSpellsProvider.notifier)
                    .toggleFavorite(spell!);
                ref.invalidate(isFavProvider(spell!.index));
              },
              icon: isFavFuture.when(
                loading: () =>
                    const Icon(Icons.bookmark_add_outlined, size: 30),
                error: (_, __) => throw UnimplementedError(),
                data: (isFavorite) => isFavorite
                    ? const Icon(Icons.bookmark_added_rounded, size: 30)
                    : const Icon(Icons.bookmark_add_outlined, size: 30),
              )

              //  const Icon(Icons.bookmark_add_outlined, size: 30),
              ),
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
