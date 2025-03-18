import 'package:flutter/material.dart';

class BasicRulesMark extends StatelessWidget {
  const BasicRulesMark({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: theme.surface,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: theme.primary),
      ),
      child: Row(
        children: [
          const Icon(Icons.menu_book_outlined, size: 30),
          const SizedBox(width: 15),
          Text(
            'Basic Rules (2014)',
            style: textStyles.bodySmall!.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
