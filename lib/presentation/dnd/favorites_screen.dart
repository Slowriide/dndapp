import 'package:dnd_app/common/widgets/favorites_infinite_scroll.dart';
import 'package:dnd_app/common/widgets/widgets.dart';

import 'package:dnd_app/presentation/providers/db/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  FavoritesScreenState createState() => FavoritesScreenState();
}

class FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;

    isLoading = true;

    final monsters =
        await ref.read(favoriteMonstersProvider.notifier).loadNextPage();
    isLoading = false;

    if (monsters.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    final favoriteMonsters =
        ref.watch(favoriteMonstersProvider).values.toList();

    if (favoriteMonsters.isEmpty) {
      return const _EmptyFav();
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          //APPBAR TEXT
          title: Text('Favorites', style: textStyles.bodyLarge),
        ),
        body: FavoritesInfiniteScroll(
          loadNextPage: loadNextPage,
          favoriteMonsters: favoriteMonsters,
        ));
  }
}

class _EmptyFav extends StatelessWidget {
  const _EmptyFav();

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        //APPBAR TEXT
        title: Text('Favorites', style: textStyles.bodyLarge),
      ),
      body: Column(
        children: [
          SizedBox(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/cthulhu.jpg',
                  height: size.height * 0.7,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          theme.surface,
                        ],
                        stops: const [0.7, 1.0],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const MySizedBox(height: 30),
          Text(
            'Your favorites items will appear here.',
            style: textStyles.bodySmall!.copyWith(fontSize: 17),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
