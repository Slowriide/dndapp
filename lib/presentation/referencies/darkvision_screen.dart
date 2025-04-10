import 'package:flutter/material.dart';

class DarkvisionScreen extends StatelessWidget {
  const DarkvisionScreen({super.key});

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
        title: Text('Darkvision', style: textStyles.bodyLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          "If you have Darkvision, you can see im Dim Light within a specified range as if it were Sint ullamco adipisicing commodo nostrud eu nostrud laborum sit est aute quis sunt.",
          style: textStyles.bodyMedium,
        ),
      ),
    );
  }
}
