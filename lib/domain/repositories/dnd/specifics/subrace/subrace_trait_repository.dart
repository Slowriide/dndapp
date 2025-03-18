import 'package:dnd_app/domain/entities/dnd/specifics/subrace/subrace_trait.dart';

abstract class SubraceTraitsRepository {
  Future<List<SubraceTraits>> getSubraceTraits(String id);
}
