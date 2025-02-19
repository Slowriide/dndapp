import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/feature.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/feature_respository.dart';

class FeatureCallUsecase implements Usecase<List<Feature>, String> {
  final FeatureRepository repository;

  FeatureCallUsecase(this.repository);
  @override
  Future<List<Feature>> call({required String params}) async {
    return await repository.getFeature(params);
  }
}
