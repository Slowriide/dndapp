import 'package:flutter/material.dart';

class RaceDetailsView extends StatelessWidget {
  const RaceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: theme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Do non fugiat aute laborum officia elit. Eiusmod dolore ea sint non irure eu pariatur fugiat amet voluptate est labore adipisicing nulla. Do incididunt ad anim irure commodo incididunt duis consectetur mollit Lorem id cillum tempor adipisicing. Nisi veniam quis commodo id id anim veniam deserunt ipsum. Ea in consectetur ea ullamco laborum. Id minim incididunt proident deserunt non laboris id aliqua et nulla.',
                    style: textStyles.bodySmall,
                  ),
                  Text(
                    'Do non fugiat aute laborum officia elit. Eiusmod dolore ea sint non irure eu pariatur fugiat amet voluptate est labore adipisicing nulla. Do incididunt ad anim irure commodo incididunt duis consectetur mollit Lorem id cillum tempor adipisicing. Nisi veniam quis commodo id id anim veniam deserunt ipsum. Ea in consectetur ea ullamco laborum. Id minim incididunt proident deserunt non laboris id aliqua et nulla.',
                    style: textStyles.bodySmall,
                  ),
                  Text(
                    '- Kaladin bendito por la tormenta',
                    style: textStyles.bodySmall!
                        .copyWith(fontStyle: FontStyle.italic),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
