import 'package:flutter/material.dart';

class MyChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const MyChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : theme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: textStyles.bodySmall,
        ),
      ),
    );
  }
}
