import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/subclasses/subclass.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/subclass/subclass_repository.dart';

class SubclassRepositoryImpl extends SubclassRepository {
  final DndDatasource datasource;

  SubclassRepositoryImpl(this.datasource);

  @override
  Future<Subclass> getSubclass(String id) async {
    return await datasource.getSubclass(id);
  }
}
