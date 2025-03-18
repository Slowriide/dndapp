import 'package:dnd_app/domain/entities/dnd/specifics/class.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/race.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClassListTile extends ConsumerWidget {
  final String? name;
  final Class? classes;

  const ClassListTile({
    super.key,
    required this.classes,
    this.name,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;

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
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    'assets/images/dndclasses/${classes?.index}.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // NAME, FROM
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Name

              Text(
                classes?.name ?? '',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              //TYPE
              const Row(
                children: [
                  Text(
                    'Basic Rules (2014)',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
