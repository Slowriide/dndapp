import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';
import 'package:dnd_app/presentation/providers/monster_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MonsterListTile extends ConsumerWidget {
  final String? name;
  final Monster? monster;

  const MonsterListTile({
    super.key,
    required this.monster,
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
                  monster!.image.replaceAll(' ', ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Name
              Text(
                name ?? '',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              //AC & HP
              Row(
                children: [
                  Text(
                    'AC:${armorClassText(monster!)}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 5,
                    width: 5,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    'HP:${monster!.hitPoints.toString()}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              Text(
                monster!.type,
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
