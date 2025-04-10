import 'package:flutter/material.dart';

class BlindsightScreen extends StatelessWidget {
  const BlindsightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        //APPBAR TEXT
        title: Text('Blindisight', style: textStyles.bodyLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          "Sit elit commodo Lorem velit excepteur aute laboris incididunt. Consectetur nulla culpa sit sit qui Lorem ipsum quis. Est deserunt est fugiat ex sint consequat nostrud anim quis.",
          style: textStyles.bodyMedium,
        ),
      ),
    );
  }
}
