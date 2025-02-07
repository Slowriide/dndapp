import 'package:dnd_app/domain/entities/dnd/generics/classes.dart';

abstract class ClassesRepository {
  Future<List<Classes>> getClasses();
}
