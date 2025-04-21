import 'package:dnd_app/data/repositories/storage/equipment_storage_repository.dart';

import 'package:dnd_app/data/sources/database/local_storage_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/specifics_entities.dart';

class EquipmentStorageRepositoryImpl extends EquipmentStorageRepository {
  final LocalStorageDatasource datasource;

  EquipmentStorageRepositoryImpl(this.datasource);

  @override
  Future<bool> isEquipmentFavorite(String equipmentId) {
    return datasource.isEquipmentFavorite(equipmentId);
  }

  @override
  Future<List<Equipment>> loadEquipment({int limit = 10, offset = 0}) {
    return datasource.loadEquipment(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleEquipmentFavorite(Equipment equipment) {
    return datasource.toggleEquipmentFavorite(equipment);
  }
}
