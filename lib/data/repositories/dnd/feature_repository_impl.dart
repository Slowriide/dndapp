import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/feature.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/feature_respository.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/monster_repository.dart';

class FeatureRepositoryImpl extends FeatureRepository {
  final DndDatasource datasource;

  FeatureRepositoryImpl(this.datasource);

  @override
  Future<List<Feature>> getFeature(String id) async {
    return await datasource.getFeature(id);
  }
}
