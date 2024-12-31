import 'package:dnd_app/common/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final Widget? child;
  const CustomAppbar({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Container(
          color: theme.surface,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const UserAvatar(),
                  Text(
                    'Library',
                    style: textStyles.bodyLarge,
                  ),
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
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 1),
                  hintText: 'Search for sourcebooks and adventures',
                  hintStyle:
                      textStyles.bodyMedium!.copyWith(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.white70),
                  filled: true,
                  fillColor: theme.primary,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
