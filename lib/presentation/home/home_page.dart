import 'package:dnd_app/presentation/views/views.dart';
import 'package:flutter/material.dart';
import 'package:dnd_app/common/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  final int pageIndex;
  const HomePage({super.key, required this.pageIndex});

  final viewRoutes = const <Widget>[
    HomeView(),
    ListingView(),
    SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.surface,
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
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
