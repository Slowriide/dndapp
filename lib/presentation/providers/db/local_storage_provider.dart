import 'package:dnd_app/data/sources/database/local_storage_datasource.dart';
import 'package:dnd_app/domain/repositories/storage/classes_storage_repository_impl.dart';
import 'package:dnd_app/domain/repositories/storage/equipment_storage_repository_impl.dart';
import 'package:dnd_app/domain/repositories/storage/local_storage_repository_impl.dart';
import 'package:dnd_app/domain/repositories/storage/magic_items_storage_repository_impl.dart';
import 'package:dnd_app/domain/repositories/storage/races_storage_repository_impl.dart';
import 'package:dnd_app/domain/repositories/storage/spell_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDatasource());
});
final magicItemsStorageRepositoryProvider = Provider((ref) {
  return MagicItemsStorageRepositoryImpl(IsarDatasource());
});
final equipmentStorageRepositoryProvider = Provider((ref) {
  return EquipmentStorageRepositoryImpl(IsarDatasource());
});
final classesStorageRepositoryProvider = Provider((ref) {
  return ClassesStorageRepositoryImpl(IsarDatasource());
});
final racesStorageRepositoryProvider = Provider((ref) {
  return RacesStorageRepositoryImpl(IsarDatasource());
});
final spellsStorageRepositoryProvider = Provider((ref) {
  return SpellStorageRepositoryImpl(IsarDatasource());
});

//si uso el service locator no necesito esto
