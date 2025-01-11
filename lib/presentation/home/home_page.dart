import 'package:dnd_app/presentation/providers/filter_provider/state_filter_provider.dart';
import 'package:dnd_app/presentation/views/search_view.dart';
import 'package:dnd_app/presentation/views/views.dart';
import 'package:flutter/material.dart';
import 'package:dnd_app/common/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  final int pageIndex;
  const HomePage({
    super.key,
    required this.pageIndex,
  });

  final viewRoutes = const <Widget>[
    HomeView(),
    ListingView(),
    SearchView(),
    SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.surface,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            _SliverAppBar(pageIndex),
          ];
        },
        body: IndexedStack(
          index: pageIndex,
          children: viewRoutes,
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: pageIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          fetchMagicItems();
        },
      ),
    );
  }
}

class _SliverAppBar extends StatefulWidget {
  final int pageIndex;
  const _SliverAppBar(this.pageIndex);

  @override
  State<_SliverAppBar> createState() => _SliverAppBarState();
}

class _SliverAppBarState extends State<_SliverAppBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return SliverAppBar(
      backgroundColor: theme.surface,
      surfaceTintColor: theme.surface,
      pinned: true,
      snap: false,
      floating: false,
      automaticallyImplyLeading: false,
      toolbarHeight: 150,
      flexibleSpace: FlexibleSpaceBar(
        title: CustomAppbar(
          title: Text(
            _getAppbarTitle(widget.pageIndex),
            style: textStyles.bodyLarge,
          ),
          child: _getAppbarActions(widget.pageIndex),
        ),
      ),
    );
  }

  String _getAppbarTitle(int index) {
    switch (index) {
      case 0:
        return "Library";
      case 1:
        return "Listing";
      case 2:
        return "Search";
      case 3:
        return "Characters";

      default:
        return 'Library';
    }
  }

  Widget _getAppbarActions(int index) {
    switch (index) {
      case 0:
        return const CustomSearchbox(
          hint: 'Search for sourcebooks and adventures',
        );
      case 1:
        return const ListingFilter();
      case 2:
        return const SearchBoxFilter(
          hint: 'Search all content...',
        );
      case 3:
        return const SizedBox();

      default:
        return const SizedBox();
    }
  }
}
