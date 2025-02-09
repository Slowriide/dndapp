import 'package:dnd_app/domain/entities/dnd/specifics/class.dart';

abstract class ClassRepository {
  Future<Class> getClass(String id);
}
