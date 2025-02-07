import 'package:dnd_app/domain/entities/dnd/specifics/equipment.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';

abstract class EquipmentRepository {
  Future<Equipment> getEquipment(String id);
}
