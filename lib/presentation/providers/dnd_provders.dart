import 'package:dnd_app/domain/entities/dnd/generics/classes.dart';
import 'package:dnd_app/domain/entities/dnd/generics/magic_items.dart';

import 'package:dnd_app/domain/entities/dnd/generics/monsters.dart';
import 'package:dnd_app/domain/repositories/dnd/classes_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/magic_items_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/monsters_repository.dart';
import 'package:dnd_app/service_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final monstersProvider = FutureProvider<List<Monsters>>((ref) async {
  final repository = sl<MonstersRepository>();

  return await repository.getMonsters();
});

final magicItemsProvider = FutureProvider<List<MagicItems>>((ref) async {
  final repository = sl<MagicItemsRepository>();

  return await repository.getMagicItems();
});
final classesrovider = FutureProvider<List<Classes>>((ref) async {
  final repository = sl<ClassesRepository>();

  return await repository.getClasses();
});
