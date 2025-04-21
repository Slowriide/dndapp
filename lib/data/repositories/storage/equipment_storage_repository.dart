import 'package:dnd_app/domain/entities/dnd/specifics/equipment.dart';

abstract class EquipmentStorageRepository {
  Future<void> toggleEquipmentFavorite(Equipment equipment);

  Future<bool> isEquipmentFavorite(String equipmentId);

  Future<List<Equipment>> loadEquipment({int limit = 10, offset = 0});
}
