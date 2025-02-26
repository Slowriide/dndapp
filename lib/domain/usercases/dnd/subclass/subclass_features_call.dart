import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/subclasses/subclass_features.dart';

import 'package:dnd_app/domain/repositories/dnd/specifics/subclass/subclass_features_repository.dart';

class SubclassFeaturesCallUsecase
    implements Usecase<List<SubclassFeatures>, String> {
  final SubclassFeaturesRepository repository;

  SubclassFeaturesCallUsecase(this.repository);
  @override
  Future<List<SubclassFeatures>> call({required String params}) async {
    return await repository.getSubclassFeature(params);
  }
}
