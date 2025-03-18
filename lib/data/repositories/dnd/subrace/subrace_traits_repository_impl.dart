import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/subrace/subrace_trait.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/subrace/subrace_trait_repository.dart';

class SubraceTraitsRepositoryImpl extends SubraceTraitsRepository {
  final DndDatasource datasource;

  SubraceTraitsRepositoryImpl(this.datasource);

  @override
  Future<List<SubraceTraits>> getSubraceTraits(String id) async {
    return await datasource.getSubraceTraits(id);
  }
}
