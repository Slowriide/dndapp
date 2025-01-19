import 'package:dnd_app/common/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CharactersAppbar extends StatelessWidget {
  const CharactersAppbar({super.key});

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const UserAvatar(
                        height: 30,
                        width: 30,
                      ),
                      Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color.fromARGB(255, 202, 53, 43),
                        ),
                        child: const Center(
                          child: Text(
                            'Slots: 1/6',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
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
              const SizedBox(height: 25),
              const Expanded(
                child: CustomSearchbox(hint: 'Search Characters'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
