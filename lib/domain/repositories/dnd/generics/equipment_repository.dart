import 'package:dnd_app/domain/entities/dnd/generics/equipment.dart';

abstract class EquipmentRepository {
  Future<List<Equipment>> getEquipment();
}
