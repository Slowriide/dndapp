import 'package:flutter/material.dart';

class MonsterListTile extends StatelessWidget {
  final String? name;
  final int? armorClass;
  final int? hp;
  final String type;
  final Widget? image;

  const MonsterListTile({
    super.key,
    this.name,
    this.image = const SizedBox(
      width: 50,
      height: 50,
      child: Placeholder(),
    ),
    this.armorClass = 15,
    this.hp = 15,
    this.type = 'unknow',
  });

  @override
  Widget build(BuildContext context) {
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
            child: image,
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
                    'AC:$armorClass',
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
                    'HP:$hp',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              Text(
                type,
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
