import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/generics/classes.dart';

import 'package:dnd_app/domain/repositories/dnd/classes_repository.dart';

class ClassesRepositoryImpl extends ClassesRepository {
  final DndDatasource datasource;

  ClassesRepositoryImpl(this.datasource);

  @override
  Future<List<Classes>> getClasses() async {
    return await datasource.getClasses(); //delego la llamada al datasource
  }
}
