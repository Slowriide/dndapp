import 'package:dnd_app/common/widgets/widgets.dart';
import 'package:dnd_app/presentation/providers/filter_provider/filder_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ListingAppbar extends ConsumerWidget {
  const ListingAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;

    final sortOrder = ref.watch(sortOrderProvider);
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
                      GestureDetector(
                        onTap: () {
                          ref.read(sortOrderProvider.notifier).state =
                              ref.read(sortOrderProvider) == SortOrder.aToZ
                                  ? SortOrder.zToA
                                  : SortOrder.aToZ;
                        },
                        child: Row(
                          children: [
                            Text(
                              sortOrder == SortOrder.aToZ
                                  ? 'Name: A - Z'
                                  : 'Name: Z - A',
                              style: const TextStyle(
                                  color: Colors.redAccent, fontSize: 13),
                            ),
                            Icon(
                              sortOrder == SortOrder.aToZ
                                  ? Icons.keyboard_arrow_up_rounded
                                  : Icons.keyboard_arrow_down_rounded,
                              color: Colors.redAccent,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => context.push('/favorites'),
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
