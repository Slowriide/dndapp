import 'package:flutter/material.dart';

class SupportButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const SupportButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ListTile(
            title: Text(text, style: textStyles.bodyMedium),
          ),
          Divider(color: theme.primary),
        ],
      ),
    );
  }
}
