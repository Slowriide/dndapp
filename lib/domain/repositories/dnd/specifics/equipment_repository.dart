import 'package:dnd_app/domain/entities/dnd/specifics/equipment.dart';

abstract class EquipmentRepository {
  Future<Equipment> getEquipment(String id);
}
