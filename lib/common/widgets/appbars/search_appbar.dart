import 'package:dnd_app/common/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SearchAppbar extends StatelessWidget {
  const SearchAppbar({
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
              Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const UserAvatar(
                        height: 30,
                        width: 30,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.bookmark_border_sharp,
                                size: 30),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text('Search', style: textStyles.titleSmall),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  const Expanded(
                    child: CustomSearchbox(hint: 'Search all content...'),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.tune,
                      color: Color.fromARGB(255, 107, 158, 247),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
