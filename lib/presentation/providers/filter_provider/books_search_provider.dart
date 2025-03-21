// providers.dart
import 'package:dnd_app/data/models/dnd/books/library.dart';
import 'package:dnd_app/domain/entities/dnd/book.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter { all, favorite, free }

final librarySearchQueryProvider = StateProvider<String>((ref) => '');

final filterProvider = StateProvider<Filter>((ref) => Filter.all);

// Filtro de libros basados en la búsqueda y el filtro actual
final libraryFilterProvider = Provider<List<Book>>((ref) {
  final searchQuery = ref.watch(librarySearchQueryProvider).toLowerCase();
  final selectedFilter = ref.watch(filterProvider);

  List<Book> filteredBooks = [];

  // Aplica el filtro seleccionado (favoritos, gratuitos, o todos)
  switch (selectedFilter) {
    case Filter.favorite:
      filteredBooks = library.where((book) => book.isFav).toList();
    case Filter.free:
      filteredBooks = library.where((book) => book.isFree).toList();
    case Filter.all:
      filteredBooks = library;
      break;
  }

  if (searchQuery.isNotEmpty) {
    filteredBooks = filteredBooks
        .where((book) =>
            book.name.toLowerCase().contains(searchQuery) ||
            book.subtitle.toLowerCase().contains(searchQuery))
        .toList();
  }
  return filteredBooks;
});
