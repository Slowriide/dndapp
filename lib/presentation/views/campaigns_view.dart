import 'package:flutter/material.dart';

class ChampaignsView extends StatelessWidget {
  const ChampaignsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 350,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/314021_1920x1342.jpg',
                  height: 350,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                    child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      theme.surface,
                    ],
                    stops: const [0.7, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                ))
              ],
            ),
          ),
          const Icon(
            Icons.auto_fix_high_outlined,
            size: 50,
          ),
          const SizedBox(height: 25),
          Text(
            'Your adventure will start soon',
            style: textStyles.bodyLarge,
          ),
          const SizedBox(height: 25),
          Text(
            textAlign: TextAlign.center,
            'Campaigns you woild join or create in the web application will appear here. You are currently not participating in any cmpaigns',
            style: textStyles.bodySmall,
          ),
          const SizedBox(height: 30),
          GestureDetector(
            child: Container(
              height: 55,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 89, 180, 255),
              ),
              child: const Center(child: Text('JOIN CAMPAIGN')),
            ),
          )
        ],
      ),
    );
  }
}
