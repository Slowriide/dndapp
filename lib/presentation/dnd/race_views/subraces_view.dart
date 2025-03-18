import 'package:dnd_app/domain/entities/dnd/specifics/race.dart';
import 'package:dnd_app/presentation/providers/dnd_provders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SubracesView extends ConsumerWidget {
  final Race selectedRace;
  const SubracesView({super.key, required this.selectedRace});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return Column(
        children: selectedRace.subraces?.map((subrace) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () => context.push('/subrace/${subrace.index}'),
                    child: Container(
                      color: theme.surface,
                      padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
                      height: 90,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            subrace.name,
                            style:
                                textStyles.bodyMedium!.copyWith(fontSize: 18),
                          ),
                          const Text(
                            "Player's Handbook (2014)",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: theme.primary),
                ],
              );
            }).toList() ??
            []);
  }
}
