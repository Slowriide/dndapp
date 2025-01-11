import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Category {
  monsters,
  magicItems,
  classes,
}

final selectedCategoryProvider =
    StateProvider<Category>((ref) => Category.monsters);
