import 'package:dnd_app/domain/entities/dnd/specifics/equipment.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EquipmentListTile extends ConsumerWidget {
  final String? name;
  final Equipment? equipment;

  const EquipmentListTile({
    super.key,
    required this.equipment,
    this.name,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;

    if (equipment == null) {
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
        //IMAGE
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
                  'https://cdn3.futbin.com/content/fifa25/img/players/p67366398.png?fm=png&ixlib=java-2.1.0&verzion=2&w=252&s=6458c19343772940b86fff00207f1360',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          //NAME WEIGHT COST
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
              //WEIGHT COST
              Row(
                children: [
                  Text(
                    equipment!.cost != null
                        ? '${equipment!.cost!.quantity} ${equipment!.cost!.unit}'
                        : '0',
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
                    equipment!.weight != null ? '${equipment!.weight} lb' : '0',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              Text(
                equipment!.gearCategory != null
                    ? equipment!.gearCategory!.name
                    : '',
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
