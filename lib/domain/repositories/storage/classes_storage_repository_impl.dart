import 'package:dnd_app/data/repositories/storage/classes_storage_repository.dart';
import 'package:dnd_app/data/sources/database/local_storage_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/specifics_entities.dart';

class ClassesStorageRepositoryImpl extends ClassesStorageRepository {
  final LocalStorageDatasource datasource;

  ClassesStorageRepositoryImpl(this.datasource);

  @override
  Future<bool> isClassFavorite(String classId) {
    return datasource.isClassFavorite(classId);
  }

  @override
  Future<List<DndClass>> loadClasses({int limit = 10, offset = 0}) {
    return datasource.loadClass(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleClassesFavorite(DndClass dndClass) {
    return datasource.toggleClassFavorite(dndClass);
  }
}
