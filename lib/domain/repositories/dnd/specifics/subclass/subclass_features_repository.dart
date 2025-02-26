import 'package:dnd_app/domain/entities/dnd/specifics/subclasses/subclass_features.dart';

abstract class SubclassFeaturesRepository {
  Future<List<SubclassFeatures>> getSubclassFeature(String id);
}
