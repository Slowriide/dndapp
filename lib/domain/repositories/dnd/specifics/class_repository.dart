import 'package:dnd_app/domain/entities/dnd/specifics/dnd_class.dart';

abstract class ClassRepository {
  Future<DndClass> getClass(String id);
}
