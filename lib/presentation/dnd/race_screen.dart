import 'package:dnd_app/domain/entities/dnd/specifics/race.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/race_traits.dart';
import 'package:dnd_app/presentation/dnd/race_views/race_details_view.dart';
import 'package:dnd_app/presentation/dnd/race_views/race_traits_view.dart';
import 'package:dnd_app/presentation/dnd/race_views/subraces_view.dart';
import 'package:dnd_app/presentation/providers/race_provider.dart';
import 'package:dnd_app/presentation/providers/race_traits_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class RaceScreen extends ConsumerStatefulWidget {
  final String raceId;
  const RaceScreen({super.key, required this.raceId});

  @override
  RacecreenState createState() => RacecreenState();
}

class RacecreenState extends ConsumerState<RaceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    ref.read(raceInfoProvider.notifier).loadRace(widget.raceId);
    ref.read(raceTraitInfoProvider.notifier).loadRaceTrait(widget.raceId);

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Race? race = ref.watch(raceInfoProvider)[widget.raceId];
    final List<RaceTrait>? raceTrait =
        ref.watch(raceTraitInfoProvider)[widget.raceId];

    final String? subraceIndex =
        race?.subraces?.isNotEmpty == true ? race!.subraces!.first.index : null;

    final theme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    if (race == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            _Appbar(
              race: race,
              textStyles: textStyles,
              theme: theme,
              tabController: _tabController,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            RaceDetailsView(
              race: race,
              subraceIndex: subraceIndex ?? '',
            ),
            RaceTraitsView(raceTraits: raceTrait, race: race),
            (race.subraces != null && race.subraces!.isNotEmpty)
                ? SubracesView(selectedRace: race)
                : const Center(
                    child: Text('No Subraces available for this race'))
          ],
        ),
      ),
    );
  }
}

class _Appbar extends StatelessWidget {
  const _Appbar({
    required this.race,
    required this.textStyles,
    required this.theme,
    required TabController tabController,
  }) : _tabController = tabController;

  final Race? race;
  final TextTheme textStyles;
  final ColorScheme theme;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100,
      floating: false,
      pinned: true,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      //IMAGE NAME FAV
      title: Row(
        children: [
          //IMAGE
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color.fromARGB(255, 255, 145, 1)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                'assets/images/races/${race!.index}.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 5),

          //NAME
          Text(race!.name, style: textStyles.bodyMedium),
          const Spacer(),

          //Fav
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_add_outlined,
              size: 30,
              color: Color.fromARGB(255, 255, 145, 1),
            ),
          ),
        ],
      ),
      bottom: TabBar(
        dividerColor: theme.primary,
        indicatorColor: Colors.amber[800],
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        labelStyle: GoogleFonts.roboto(fontSize: 15),
        indicatorSize: TabBarIndicatorSize.tab,
        controller: _tabController,
        tabs: const [
          Tab(text: 'DETAILS'),
          Tab(text: 'TRAITS'),
          Tab(text: 'SUBRACES'),
        ],
      ),
    );
  }
}
