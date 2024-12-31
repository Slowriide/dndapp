import 'package:dnd_app/domain/entities/dnd/classes.dart';

abstract class ClassesRepository {
  Future<List<Classes>> getClasses();
}
