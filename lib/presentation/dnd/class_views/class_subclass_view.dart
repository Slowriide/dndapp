import 'package:dnd_app/domain/entities/dnd/specifics/class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClassSubclassView extends StatelessWidget {
  final Class selectedclass;
  const ClassSubclassView({super.key, required this.selectedclass});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return ListView(
      padding: const EdgeInsets.only(top: 0),
      children: [
        Column(
          children: [
            ListView.builder(
              padding: const EdgeInsets.only(top: 0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: selectedclass.subclasses?.length ?? 1,
              itemBuilder: (context, index) {
                final subclass = selectedclass.subclasses?[index];

                return Column(
                  children: [
                    GestureDetector(
                      onTap: () => context.push('/subclass/${subclass!.index}'),
                      child: Container(
                        color: theme.surface,
                        padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
                        height: 90,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(subclass?.name ?? '',
                                style: textStyles.bodyMedium!
                                    .copyWith(fontSize: 18)),
                            const Text(
                              "Player's Handbook (2014)",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(color: theme.primary)
                  ],
                );
              },
            )
          ],
        )
      ],
    );
  }
}
