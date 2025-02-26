import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/subclasses/subclass_features.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/subclass/subclass_features_repository.dart';

class SubclassFeaturesRepositoryImpl extends SubclassFeaturesRepository {
  final DndDatasource datasource;

  SubclassFeaturesRepositoryImpl(this.datasource);

  @override
  Future<List<SubclassFeatures>> getSubclassFeature(String id) async {
    return await datasource.getSubclassFeatures(id);
  }
}
