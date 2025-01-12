import 'package:dnd_app/common/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ListingAppbar extends StatelessWidget {
  const ListingAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
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
                  Column(
                    children: [
                      Text('Listing', style: textStyles.titleSmall),
                      const Text(
                        'Name: A - Z',
                        style: TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark_border_sharp, size: 30),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 25),
              const Expanded(
                child: ListingFilter(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
