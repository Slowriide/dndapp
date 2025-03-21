import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSearchbox extends ConsumerWidget {
  final String hint;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  const CustomSearchbox({
    super.key,
    required this.hint,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
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
      ),
    );
  }
}
