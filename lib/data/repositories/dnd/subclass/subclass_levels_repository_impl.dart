import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/subclasses/subclass_levels.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/subclass/subclass_levels_repository.dart';

class SubclassLevelsRepositoryImpl extends SubclassLevelsRepository {
  final DndDatasource datasource;

  SubclassLevelsRepositoryImpl(this.datasource);

  @override
  Future<List<SubclassLevels>> getSubclassLevels(String id) async {
    return await datasource.getSubclassLevels(id);
  }
}
