import 'package:dnd_app/common/widgets/widgets.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/specifics_entities.dart';
import 'package:flutter/material.dart';

class FavoritesInfiniteScroll extends StatefulWidget {
  final List<Monster> favoriteMonsters;
  final VoidCallback? loadNextPage;

  const FavoritesInfiniteScroll(
      {super.key, required this.favoriteMonsters, this.loadNextPage});

  @override
  State<FavoritesInfiniteScroll> createState() =>
      _FavoritesInfiniteScrollState();
}

class _FavoritesInfiniteScrollState extends State<FavoritesInfiniteScroll> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if ((scrollController.position.pixels + 100) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.favoriteMonsters.length,
      itemBuilder: (context, index) {
        final favoriteMonster = widget.favoriteMonsters[index];
        return FavoriteListTile(
          monster: favoriteMonster,
        );
      },
    );
  }
}
