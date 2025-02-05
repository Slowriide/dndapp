import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Category {
  monsters,
  magicItems,
  classes,
  equipment,
  races,
  spells,
}

final selectedCategoryProvider =
    StateProvider<Category>((ref) => Category.monsters);
