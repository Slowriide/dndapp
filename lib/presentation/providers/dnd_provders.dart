import 'package:dnd_app/domain/entities/dnd/generics/generic_entities.dart';
import 'package:dnd_app/domain/repositories/dnd/backgrounds_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/classes_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/equipment_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/magic_items_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/monsters_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/races_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/spells_repository.dart';
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

final classesProvider = FutureProvider<List<Classes>>((ref) async {
  final repository = sl<ClassesRepository>();

  return await repository.getClasses();
});

final equipmentProvider = FutureProvider<List<Equipment>>((ref) async {
  final repository = sl<EquipmentRepository>();

  return await repository.getEquipment();
});
final racesProvider = FutureProvider<List<Races>>((ref) async {
  final repository = sl<RacesRepository>();

  return await repository.getRaces();
});

final spellsProvider = FutureProvider<List<Spells>>((ref) async {
  final repository = sl<SpellsRepository>();

  return await repository.getSpells();
});
