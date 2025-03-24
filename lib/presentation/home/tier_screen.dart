import 'package:dnd_app/common/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TierScreen extends StatefulWidget {
  const TierScreen({super.key});

  @override
  State<TierScreen> createState() => _TierScreenState();
}

class _TierScreenState extends State<TierScreen> {
  int _selectedIndex = 0;
  int paymentIndex = -1;

  void selectButton(int index) {
    setState(() {
      paymentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: theme.surface,
      //APPBAR
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        //APPBAR TEXT
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Subscriptions', style: textStyles.bodyMedium),
            Text(
              'Current: Free Tier',
              style: textStyles.bodySmall!.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTabButton('Master', 'master_logo.png', 0),
                const SizedBox(width: 1),
                buildTabButton('Hero', 'hero_logo.png', 1),
              ],
            ),
            Expanded(
              child: buildTabContent(
                _selectedIndex,
              ),
            ),
            const MySizedBox(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                  text: 'By continuing you agree to ',
                  style: textStyles.bodySmall,
                ),
                TextSpan(
                    text: 'these terms',
                    style: textStyles.bodySmall!.copyWith(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // ignore: avoid_print
                        print("Palabras resaltadas clickeadas!");
                      }),
                TextSpan(
                  text:
                      '. Recurring billing. You may cancel subscription any time. Your cancelation is effective at the end of the current subscription term. No refunds for partial billing period.',
                  style: textStyles.bodySmall,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTabButton(String text, String logo, int index) {
    bool isSelected = _selectedIndex == index;
    final theme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: AnimatedContainer(
        width: isSelected ? width * 0.53 : width * 0.4,
        height: isSelected ? 70 : 60,
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? theme.primary : theme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          border: Border.all(color: theme.secondary),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 30,
              height: 40,
              child: Image.asset('assets/images/$logo'),
            ),
            const SizedBox(width: 5),
            Text(
              text,
              style: textStyles.titleMedium!.copyWith(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabContent(int selectedIndex) {
    final theme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        border: Border(
          left: BorderSide(color: theme.secondary),
          right: BorderSide(color: theme.secondary),
          bottom: BorderSide(color: theme.secondary),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SUSCRIPTION BENEFITS',
            style: textStyles.bodySmall!.copyWith(color: Colors.grey),
          ),
          const MySizedBox(),
          SizedBox(
            height: 400,
            child: selectedIndex == 0
                ? Column(
                    children: [
                      benefits('Two week early acces to core rulebooks'),
                      benefits('Create unlimited characters'),
                      benefits('Create unlimited encounters'),
                      benefits('Add publicly shared homebrew content'),
                      benefits('Exclusive suscriber perks every month'),
                      benefits('Host epic game sessions with Maps'),
                      benefits('Share unlocked content with other players'),
                      const Spacer(),
                      Divider(color: theme.secondary)
                    ],
                  )
                : Column(
                    children: [
                      benefits('One week early acces to core rulebooks'),
                      benefits('Create unlimited characters'),
                      benefits('Create unlimited encounters'),
                      benefits('Add publicly shared homebrew content'),
                      benefits('Exclusive suscriber perks every month'),
                      const Spacer(),
                      Divider(color: theme.secondary),
                    ],
                  ),
          ),
          const MySizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ToggleButton(
                index: 0,
                title: "Monthly",
                subtitle: "US\$ 5,99",
                time: '/month',
                isSelected: paymentIndex == 0,
                onSelect: selectButton,
              ),
              ToggleButton(
                index: 1,
                title: "Semi-Annually",
                subtitle: "US\$ 29,99",
                time: '/6 month',
                isSelected: paymentIndex == 1,
                onSelect: selectButton,
              ),
              Stack(
                children: [
                  ToggleButton(
                    index: 2,
                    title: "Annueally",
                    subtitle: "US\$ 54,99",
                    time: '/year',
                    isSelected: paymentIndex == 2,
                    onSelect: selectButton,
                  ),
                  Container(
                    height: 25,
                    width: 120,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 40, 207, 157),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                    child: Text(
                      'Save 25% off',
                      style:
                          textStyles.bodyMedium!.copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const MySizedBox(height: 35),
          const MyButtonLarge(
            color: Colors.blue,
            text: 'PURCHASE NOW',
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget benefits(String text) {
    final textStyles = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.check, color: Colors.blue),
            const SizedBox(width: 10),
            Text(text, style: textStyles.bodyMedium),
          ],
        ),
        const MySizedBox(height: 15),
      ],
    );
  }
}

class ToggleButton extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final String time;
  final bool isSelected;
  final Function(int) onSelect;

  const ToggleButton({
    super.key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => onSelect(index),
      child: AnimatedContainer(
        height: 130,
        width: 120,
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? theme.surface : theme.secondary,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title, style: textStyles.bodySmall),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: textStyles.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              time,
              style: textStyles.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
