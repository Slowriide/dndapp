import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';

import 'package:dnd_app/domain/entities/dnd/generics/feats.dart';

import 'package:dnd_app/domain/repositories/dnd/generics/feats_repository.dart';

class FeatsRepositoryImpl extends FeatsRepository {
  final DndDatasource datasource;

  FeatsRepositoryImpl(this.datasource);

  @override
  Future<List<Feats>> getFeats() async {
    return await datasource.getFeats();
  }
}
