import 'package:flutter/material.dart';

class CustomFloatButton extends StatelessWidget {
  const CustomFloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      height: 40,
      width: 230,
      decoration: BoxDecoration(
        color: theme.primary,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Center(
          child: Text(
        'CREATE NEW CHARACTER',
        style: TextStyle(
          color: Colors.blue,
        ),
      )),
    );
  }
}
