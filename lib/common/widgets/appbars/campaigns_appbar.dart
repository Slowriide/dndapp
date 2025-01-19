import 'package:dnd_app/common/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CampaignsAppbar extends StatelessWidget {
  const CampaignsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Container(
          color: theme.surface,
          width: double.infinity,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UserAvatar(
                        height: 30,
                        width: 30,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('My Characters', style: textStyles.titleSmall),
                      const Text(
                        'Name: A - Z',
                        style: TextStyle(
                            color: Color.fromARGB(255, 63, 158, 236),
                            fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
