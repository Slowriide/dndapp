import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/domain/entities/dnd/generics/generic_entities.dart';

import 'package:dnd_app/domain/repositories/dnd/generics/feats_repository.dart';

class FeatsCallUserCase implements Usecase<List<Feats>, void> {
  final FeatsRepository repository;

  FeatsCallUserCase(this.repository);
  @override
  Future<List<Feats>> call({void params}) async {
    return await repository.getFeats();
  }
}
