import 'package:dnd_app/presentation/views/search_view.dart';
import 'package:dnd_app/presentation/views/views.dart';
import 'package:flutter/material.dart';
import 'package:dnd_app/common/widgets/widgets.dart';

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

    return SliverAppBar(
      backgroundColor: theme.surface,
      surfaceTintColor: theme.surface,
      pinned: true,
      snap: false,
      floating: false,
      automaticallyImplyLeading: false,
      toolbarHeight: 150,
      flexibleSpace: FlexibleSpaceBar(title: _getAppbar(widget.pageIndex)),
    );
  }

  Widget _getAppbar(int index) {
    switch (index) {
      case 0:
        return const CustomAppbar();
      case 1:
        return const ListingAppbar();
      case 2:
        return const SearchAppbar();
      case 3:
        return const SizedBox();

      default:
        return const SizedBox();
    }
  }
}
