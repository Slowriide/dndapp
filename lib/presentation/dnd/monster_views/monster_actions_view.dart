import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';
import 'package:flutter/material.dart';

class MonsterActionsView extends StatelessWidget {
  final Monster? monster;
  const MonsterActionsView({super.key, this.monster});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ACTIONS',
              style: TextStyle(color: Color.fromARGB(188, 243, 106, 97)),
            ),
            const SizedBox(height: 20),
            ...monsterActions(context, monster!.actions ?? []),
          ],
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'LEGENDARY ACTIONS',
              style: TextStyle(color: Color.fromARGB(188, 243, 106, 97)),
            ),
            const SizedBox(height: 20),
            ...legendaryActionsText(context, monster!.legendaryActions),
          ],
        ),
      ],
    );
  }
}
