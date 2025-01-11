import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangelogBox extends StatelessWidget {
  const ChangelogBox({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => context.push('/changelog'),
      child: Container(
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color.fromARGB(255, 49, 49, 49)),
          gradient: LinearGradient(
            colors: [
              theme.surface, // Color inicial
              theme.primary, // Color final
            ],
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('Changelog: Version 2.65'),
                      SizedBox(width: 5),
                      Text(
                        '11/20/2024',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '- Minior bug fixes and improvements',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
