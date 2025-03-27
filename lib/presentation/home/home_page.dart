import 'package:dnd_app/presentation/dnd/join_campaign_screen.dart';
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
    CharactersView(),
    ChampaignsView(),
    JoinCampaignScreen(),
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
      // floatingActionButton: _getFloatingActionButton(pageIndex),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _getFloatingActionButton(int index) {
    switch (index) {
      case 0:
        return FloatingActionButton(
          onPressed: () async {},
        );
      case 1:
        return const SizedBox();
      case 2:
        return const SizedBox();
      case 3:
        return const CustomFloatButton();

      default:
        return const SizedBox();
    }
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
      toolbarHeight: _getAppbarHeight(widget.pageIndex),
      flexibleSpace: FlexibleSpaceBar(
        title: _getAppbar(widget.pageIndex),
      ),
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
        return const CharactersAppbar();
      case 4:
        return const CampaignsAppbar();

      default:
        return const SizedBox();
    }
  }

  double _getAppbarHeight(int index) {
    switch (index) {
      case 0:
        return 150;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 150;
      case 4:
        return 71;

      default:
        return 150;
    }
  }
}
