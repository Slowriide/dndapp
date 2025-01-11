import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSearchbox extends ConsumerWidget {
  final String hint;
  const CustomSearchbox({super.key, required this.hint});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 1),
        hintText: hint,
        hintStyle: textStyles.bodyMedium!.copyWith(color: Colors.grey),
        prefixIcon: const Icon(Icons.search, color: Colors.white70, size: 27),
        filled: true,
        fillColor: theme.primary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
