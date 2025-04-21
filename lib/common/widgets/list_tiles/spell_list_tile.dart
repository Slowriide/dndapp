import 'package:dnd_app/domain/entities/dnd/specifics/spell.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpellListTile extends ConsumerWidget {
  final String? name;
  final Spell? spell;

  const SpellListTile({
    super.key,
    required this.spell,
    this.name,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;

    if (spell == null) {
      return ListTile(
        title: Center(
          child: Text('$name is not available'),
        ),
      );
    }

    return Container(
      height: 95,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.primary),
        ),
        color: theme.surface,
      ),
      child: Row(
        children: [
          //IMAGE
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border:
                    Border.all(color: const Color.fromARGB(190, 245, 83, 71)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  'https://cdn3.futbin.com/content/fifa25/img/players/p50589182.png?fm=png&ixlib=java-2.1.0&verzion=2&w=252&s=1dd6e690b309795f17663fdb82fabd42',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // NAME, TYPE, DESC
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Name

              SizedBox(
                width: 250,
                child: Text(
                  name ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              //TYPE
              Row(
                children: [
                  Text(
                    '${spell!.level}${getOrdinalSuffix(spell!.level)} Level ${spell!.school?.name ?? ''}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),

              //DESC
              Text(
                spell!.duration ?? '',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 11,
                ),
              ),
            ],
          )
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
