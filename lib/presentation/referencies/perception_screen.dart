import 'package:flutter/material.dart';

class PerceptionScreen extends StatelessWidget {
  const PerceptionScreen({super.key});

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
        title: Text('Perception', style: textStyles.bodyLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          "Wisdom (Percetion) allows you to use a combination of senses to notice something that's easy to miss",
          style: textStyles.bodyMedium,
        ),
      ),
    );
  }
}
