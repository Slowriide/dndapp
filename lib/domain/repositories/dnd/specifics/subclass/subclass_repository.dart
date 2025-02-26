import '../../../../entities/dnd/specifics/subclasses/subclass.dart';

abstract class SubclassRepository {
  Future<Subclass> getSubclass(String id);
}
