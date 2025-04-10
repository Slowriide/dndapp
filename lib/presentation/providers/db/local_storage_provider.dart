import 'package:dnd_app/data/sources/database/local_storage_datasource.dart';
import 'package:dnd_app/domain/repositories/storage/local_storage_repository_impl.dart';
import 'package:dnd_app/domain/repositories/storage/magic_items_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDatasource());
});
final magicItemsStorageRepositoryProvider = Provider((ref) {
  return MagicItemsStorageRepositoryImpl(IsarDatasource());
});
