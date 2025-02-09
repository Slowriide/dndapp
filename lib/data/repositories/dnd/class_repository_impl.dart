import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/class.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/class_repository.dart';

class ClassRepositoryImpl extends ClassRepository {
  final DndDatasource datasource;

  ClassRepositoryImpl(this.datasource);

  @override
  Future<Class> getClass(String id) async {
    return await datasource.getClass(id);
  }
}
