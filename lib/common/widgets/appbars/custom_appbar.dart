import 'package:dnd_app/common/widgets/appbars/popover_menu.dart';
import 'package:dnd_app/common/widgets/widgets.dart';
import 'package:dnd_app/presentation/providers/filter_provider/books_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:popover/popover.dart';

class CustomAppbar extends ConsumerStatefulWidget {
  const CustomAppbar({super.key});

  @override
  _CustomAppbarState createState() => _CustomAppbarState();
}

class _CustomAppbarState extends ConsumerState<CustomAppbar> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();

    final searchQuery = ref.read(librarySearchQueryProvider);
    _searchController = TextEditingController(text: searchQuery);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
                            onPressed: () => context.push('/favorites'),
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
              Expanded(
                child: CustomSearchbox(
                  hint: 'Search for sourcebooks and adventures',
                  onChanged: (value) {
                    ref.read(librarySearchQueryProvider.notifier).state = value;
                  },
                  controller: _searchController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
