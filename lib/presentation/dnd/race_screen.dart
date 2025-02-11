import 'package:dnd_app/domain/entities/dnd/specifics/race.dart';
import 'package:dnd_app/presentation/providers/race_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RaceScreen extends ConsumerStatefulWidget {
  final String raceId;
  const RaceScreen({super.key, required this.raceId});

  @override
  RacecreenState createState() => RacecreenState();
}

class RacecreenState extends ConsumerState<RaceScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(raceInfoProvider.notifier).loadRace(widget.raceId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Race? race = ref.watch(raceInfoProvider)[widget.raceId];

    if (race == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Text(race.name),
      ),
    );
  }
}
