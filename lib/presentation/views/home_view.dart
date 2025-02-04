import 'package:dnd_app/common/widgets/book_item.dart';
import 'package:dnd_app/domain/entities/dnd/book.dart';
import 'package:dnd_app/data/models/dnd/books/library.dart';
import 'package:dnd_app/domain/usercases/dnd/classes_call.dart';
import 'package:dnd_app/domain/usercases/dnd/magic_item_call.dart';
import 'package:dnd_app/domain/usercases/dnd/monster_call.dart';
import 'package:dnd_app/domain/usercases/dnd/monsters_call.dart';

import 'package:dnd_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

//PRUEBAS

void printFullText(String text) {
  final pattern =
      RegExp('.{1,800}'); // Divide el texto en trozos de hasta 800 caracteres
  // ignore: avoid_print
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

void fetchMonsters() async {
  final getMonstersUsecase = sl<MonstersCallUserCase>();

  final monsters = await getMonstersUsecase.call();
  printFullText(monsters.toString());
}

void fetchClasses() async {
  final getClassesUsercase = sl<ClassesCallUserCase>();

  final monsters = await getClassesUsercase.call();
  printFullText(monsters.toString());
}

void fetchMagicItems() async {
  final getMagicItemsUsercase = sl<MagicItemsCallUserCase>();

  final monsters = await getMagicItemsUsercase.call();
  printFullText(monsters.toString());
}

void fetchMonster() async {
  final getMonsterUsercase = sl<MonsterCallUsecase>();

  final monster = await getMonsterUsercase.call(params: 'adult-black-dragon');
  printFullText(monster.toString());
}

//FILTRO

enum Filter { all, favorite, free }

Filter selectedFilter = Filter.all;

List<Book> get filteredBooks {
  switch (selectedFilter) {
    case Filter.favorite:
      return library.where((book) => book.isFav).toList();
    case Filter.free:
      return library.where((book) => book.isFree).toList();
    case Filter.all:
      return library;
  }
}

class _HomeViewState extends State<HomeView> {
  // Lista de chips (puedes reemplazar esto con tus datos)
  final List<String> chips = ['Fantasía', 'Aventura', 'Dragones'];

  // Variable para controlar si la sección de chips está visible
  final bool _showChips = true;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
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
                    final bool isSelected = selectedFilter == filter;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ChoiceChip(
                        label: Text(
                          filter == Filter.all
                              ? "All"
                              : filter == Filter.favorite
                                  ? "Favorite"
                                  : "Free",
                        ),
                        selected: isSelected,
                        onSelected: (selected) {
                          if (selected) {
                            setState(() {
                              selectedFilter = filter;
                            });
                          }
                        },
                        selectedColor: Colors.red,
                        elevation: 0,
                        backgroundColor: theme.primary,
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
              final book = filteredBooks[index];
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
            childCount: filteredBooks.length,
          ),
        ),
      ],
    );
  }
}
