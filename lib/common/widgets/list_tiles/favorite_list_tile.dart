import 'package:animate_do/animate_do.dart';
import 'package:dnd_app/domain/entities/dnd/favoriteable.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoriteListTile extends StatelessWidget {
  final Favoritable favorite;

  const FavoriteListTile({super.key, required this.favorite});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return FadeInRight(
      child: GestureDetector(
        onTap: () => context.push(favorite.navigatePath),
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
                        favorite.imageUrl != null
                            ? favorite.imageUrl!.replaceAll(' ', '')
                            : 'https://cdn3.futbin.com/content/fifa25/img/players/p134475262.png?fm=png&ixlib=java-2.1.0&verzion=1&w=252&s=e1e6294f3cbf185c802b60c63f8f00fa',
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
                    favorite.displayName,
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
