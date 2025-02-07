import 'package:dnd_app/domain/entities/dnd/generics/feats.dart';

abstract class FeatsRepository {
  Future<List<Feats>> getFeats();
}
