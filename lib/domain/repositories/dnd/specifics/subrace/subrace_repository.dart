import 'package:dnd_app/domain/entities/dnd/specifics/subrace/subrace.dart';

abstract class SubraceRepository {
  Future<Subrace> getSubrace(String id);
}
