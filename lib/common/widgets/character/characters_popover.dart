import 'package:dnd_app/common/widgets/general/my_sized_box.dart';
import 'package:dnd_app/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CharactersPopover extends StatelessWidget {
  final Function()? onSimpleTap;
  final Function()? onCustomAllTap;
  const CharactersPopover({
    super.key,
    this.onSimpleTap,
    this.onCustomAllTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const _MenuOption(
                  text:
                      'Create a characer froma a selection of exciting premade adventurers!',
                ),
              ),
              const MySizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: const _MenuOption(
                  text:
                      'Create a character by making choices using a step-by-step approach.',
                ),
              ),
              const MySizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: MyButtonLarge(
                  color: Colors.blue,
                  text: 'X CANCEL',
                  onTap: () => context.pop(),
                ),
              )
            ],
          ),
          Positioned(
            bottom: size.height * 0.212,
            child: Container(
              height: 45,
              width: 300,
              decoration: BoxDecoration(
                color: theme.secondary,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: theme.inversePrimary),
              ),
              child: const Center(
                child: Text('SIMPLE'),
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.065,
            child: Container(
              height: 45,
              width: 300,
              decoration: BoxDecoration(
                color: theme.secondary,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: theme.inversePrimary),
              ),
              child: const Center(
                child: Text('CUSTOM'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuOption extends StatelessWidget {
  final String text;
  const _MenuOption({required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      height: 100,
      width: 370,
      decoration: BoxDecoration(
        color: theme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
