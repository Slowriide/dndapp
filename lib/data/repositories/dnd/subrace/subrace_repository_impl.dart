import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/subrace/subrace.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/subrace/subrace_repository.dart';

class SubraceRepositoryImpl extends SubraceRepository {
  final DndDatasource datasource;

  SubraceRepositoryImpl(this.datasource);

  @override
  Future<Subrace> getSubrace(String id) async {
    return await datasource.getSubrace(id);
  }
}
