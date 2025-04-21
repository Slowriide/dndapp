import 'package:dnd_app/domain/entities/dnd/specifics/dnd_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClassSubclassView extends StatelessWidget {
  final DndClass selectedclass;
  const ClassSubclassView({super.key, required this.selectedclass});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return Column(
      children: selectedclass.subclasses?.map((subclass) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () => context.push('/subclass/${subclass.index}'),
                  child: Container(
                    color: theme.surface,
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
                    height: 90,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subclass.name,
                          style: textStyles.bodyMedium!.copyWith(fontSize: 18),
                        ),
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
                Divider(color: theme.primary),
              ],
            );
          }).toList() ??
          [],
    );
  }
}
