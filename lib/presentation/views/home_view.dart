import 'package:dnd_app/common/widgets/book_item.dart';

import 'package:dnd_app/domain/usercases/dnd/levels_per_class.dart';
import 'package:dnd_app/presentation/providers/filter_provider/books_search_provider.dart';

import 'package:dnd_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  _HomeViewState createState() => _HomeViewState();
}

//PRUEBAS

void printFullText(String text) {
  final pattern =
      RegExp('.{1,800}'); // Divide el texto en trozos de hasta 800 caracteres
  // ignore: avoid_print
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

void fetchLevels() async {
  final getLevels = sl<LevelPerClassCallUsecase>();

  final levels = await getLevels.call(params: 'warlock');
  printFullText(levels.toString());
}

///*

class _HomeViewState extends ConsumerState<HomeView> {
  // Variable para controlar si la sección de chips está visible
  final bool _showChips = true;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final books = ref.watch(libraryFilterProvider);
    final selectedFilter = ref.watch(filterProvider);

    return CustomScrollView(
      slivers: [
        // Sección de chips que se oculta al hacer scroll
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15.0, left: 12),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: _showChips ? 50 : 0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: Filter.values.map((filter) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ChoiceChip(
                        label: Text(filter.name.toUpperCase()),
                        selected: selectedFilter == filter,
                        onSelected: (selected) {
                          if (selected) {
                            ref.read(filterProvider.notifier).state = filter;
                          }
                        },
                        selectedColor: Colors.red,
                        elevation: 0,
                        backgroundColor: theme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: const BorderSide(color: Colors.transparent),
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
        // Lista de libros
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final book = books[index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.push('/home/0/book', extra: book);
                    },
                    child: BookItem(
                      title: book.name,
                      subtitle: book.subtitle,
                      imageUrl: book.imagePath,
                      price: book.price.toString(),
                      tags: book.tags,
                    ),
                  ),
                ],
              );
            },
            childCount: books.length,
          ),
        ),
      ],
    );
  }
}
