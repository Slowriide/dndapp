import 'package:dnd_app/common/widgets/appbars/popover_menu.dart';
import 'package:dnd_app/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
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
                          //Envuelvo el iconbutton en un builder para que el popover agarre bien la referencia
                          Builder(
                            builder: (context) => IconButton(
                              onPressed: () => showPopover(
                                width: 120,
                                height: 100,
                                backgroundColor:
                                    Theme.of(context).colorScheme.surface,
                                context: context,
                                bodyBuilder: (context) => PopoverMenu(
                                  onDownloadAllTap: () {},
                                  onUpdateAllTap: () {},
                                ),
                              ),
                              icon: const Icon(Icons.more_vert, size: 30),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.bookmark_border_sharp,
                                size: 30),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text('Library', style: textStyles.titleSmall),
                ],
              ),
              const SizedBox(height: 25),
              const Expanded(
                child: CustomSearchbox(
                    hint: 'Search for sourcebooks and adventures'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
