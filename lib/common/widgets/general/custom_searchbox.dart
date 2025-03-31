import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSearchbox extends ConsumerWidget {
  final String hint;
  final bool borderside;
  final bool padding;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  const CustomSearchbox({
    super.key,
    required this.hint,
    this.borderside = false,
    this.padding = true,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: padding
          ? const EdgeInsets.symmetric(horizontal: 10)
          : const EdgeInsets.all(0),
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
            borderRadius: BorderRadius.circular(5.0),
            borderSide: borderside
                ? const BorderSide(color: Colors.white)
                : BorderSide.none,
          ),
        ),
      ),
    );
  }
}
