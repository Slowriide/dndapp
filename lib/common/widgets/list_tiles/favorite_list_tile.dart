import 'package:animate_do/animate_do.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/specifics_entities.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoriteListTile extends StatelessWidget {
  final Monster? monster;

  const FavoriteListTile({super.key, required this.monster});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return FadeInRight(
      child: GestureDetector(
        onTap: () => context.push('/home/0/api/2014/monsters/${monster!.id}'),
        child: Container(
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
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: const Color.fromARGB(190, 245, 83, 71)),
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        monster?.image != null
                            ? monster!.image.replaceAll(' ', '')
                            : 'assets/images/dndclasses/no-photo.png',
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
                    monster?.name ?? '',
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
        ),
      ),
    );
  }
}
