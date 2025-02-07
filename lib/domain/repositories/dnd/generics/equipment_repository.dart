import 'package:dnd_app/domain/entities/dnd/generics/equipments.dart';

abstract class EquipmentGenericRepository {
  Future<List<EquipmentGeneric>> getEquipmentGeneric();
}
