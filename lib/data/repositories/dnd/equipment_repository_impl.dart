import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/equipment.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/equipment_repository.dart';

class EquipmentRepositoryImpl extends EquipmentRepository {
  final DndDatasource datasource;

  EquipmentRepositoryImpl(this.datasource);

  @override
  Future<Equipment> getEquipment(String id) async {
    return await datasource.getEquipment(id);
  }
}
