import 'package:dnd_app/domain/entities/dnd/generics/generic_entities.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/subclasses/subclass.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/subclasses/subclass_features.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/subclasses/subclass_levels.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/subrace/subrace.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/subrace/subrace_trait.dart';
import 'package:dnd_app/domain/repositories/dnd/generics/classes_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/generics/equipment_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/generics/magic_items_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/generics/monsters_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/generics/races_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/generics/spells_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/subclass/subclass_features_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/subclass/subclass_levels_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/subclass/subclass_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/subrace/subrace_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/subrace/subrace_trait_repository.dart';
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

final equipmentProvider = FutureProvider<List<EquipmentGeneric>>((ref) async {
  final repository = sl<EquipmentGenericRepository>();

  return await repository.getEquipmentGeneric();
});
final racesProvider = FutureProvider<List<Races>>((ref) async {
  final repository = sl<RacesRepository>();

  return await repository.getRaces();
});

final spellsProvider = FutureProvider<List<Spells>>((ref) async {
  final repository = sl<SpellsRepository>();

  return await repository.getSpells();
});

final subclassProvider =
    FutureProvider.family<Subclass, String>((ref, id) async {
  final repository = sl<SubclassRepository>();
  return await repository.getSubclass(id);
});

final subclassFeaturesProvider =
    FutureProvider.family<List<SubclassFeatures>, String>((ref, id) async {
  final repository = sl<SubclassFeaturesRepository>();

  return await repository.getSubclassFeature(id);
});
final subclassLevelsProvider =
    FutureProvider.family<List<SubclassLevels>, String>((ref, id) async {
  final repository = sl<SubclassLevelsRepository>();

  return await repository.getSubclassLevels(id);
});

final subraceProvider = FutureProvider.family<Subrace, String>((ref, id) async {
  final repository = sl<SubraceRepository>();
  return await repository.getSubrace(id);
});

final subraceTraitsProvider =
    FutureProvider.family<List<SubraceTraits>, String>((ref, id) async {
  final repository = sl<SubraceTraitsRepository>();

  return await repository.getSubraceTraits(id);
});
