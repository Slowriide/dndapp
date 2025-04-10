import 'package:dnd_app/domain/entities/dnd/specifics/magic_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MagicItemListTile extends ConsumerWidget {
  final String? name;
  final MagicItem? magicItem;

  const MagicItemListTile({
    super.key,
    required this.magicItem,
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  'https://cdn3.futbin.com/content/fifa25/img/players/p134475262.png?fm=png&ixlib=java-2.1.0&verzion=1&w=252&s=e1e6294f3cbf185c802b60c63f8f00fa',
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
                    magicItem!.equipmentCategory?.name ?? '',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),

              //DESC
              Text(
                magicItem!.desc[0].split(',').last,
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
