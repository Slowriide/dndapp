import 'package:dnd_app/domain/entities/dnd/specifics/dnd_class.dart';

abstract class ClassesStorageRepository {
  Future<void> toggleClassesFavorite(DndClass classes);

  Future<bool> isClassFavorite(String classId);

  Future<List<DndClass>> loadClasses({int limit = 10, offset = 0});
}
