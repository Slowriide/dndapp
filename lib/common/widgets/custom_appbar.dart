import 'package:dnd_app/common/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final Widget child;
  final Text title;
  const CustomAppbar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Container(
          color: theme.surface,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const UserAvatar(
                    height: 30,
                    width: 30,
                  ),
                  title,
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert, size: 30),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark_border_sharp, size: 30),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 25),
              Expanded(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
