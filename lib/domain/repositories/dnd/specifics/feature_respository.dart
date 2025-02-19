import 'package:dnd_app/domain/entities/dnd/specifics/feature.dart';

abstract class FeatureRepository {
  Future<List<Feature>> getFeature(String id);
}
