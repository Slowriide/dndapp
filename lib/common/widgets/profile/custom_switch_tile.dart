import 'package:flutter/material.dart';

class CustomSwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  const CustomSwitchTile({
    super.key,
    required this.value,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;

    return Column(
      children: [
        SwitchListTile(
          activeColor: Colors.lightBlue,
          activeTrackColor: const Color.fromARGB(255, 0, 106, 155),
          inactiveThumbColor: Colors.lightBlue,
          inactiveTrackColor: const Color.fromARGB(255, 0, 106, 155),
          title: Text(title, style: textStyles.bodyMedium),
          value: value,
          onChanged: onChanged,
        ),
        Divider(color: theme.primary),
      ],
    );
  }
}
