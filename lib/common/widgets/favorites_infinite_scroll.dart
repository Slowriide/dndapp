import 'package:dnd_app/common/widgets/widgets.dart';
import 'package:dnd_app/domain/entities/dnd/favoriteable.dart';

import 'package:flutter/material.dart';

class FavoritesInfiniteScroll extends StatefulWidget {
  final List<Favoritable> favorites;
  final VoidCallback? loadNextPage;

  const FavoritesInfiniteScroll(
      {super.key, required this.favorites, this.loadNextPage});

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
      controller: scrollController,
      itemCount: widget.favorites.length,
      itemBuilder: (context, index) {
        final favorite = widget.favorites[index];
        return FavoriteListTile(
          favorite: favorite,
        );
      },
    );
  }
}
