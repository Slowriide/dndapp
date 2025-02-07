import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/generics/equipment.dart';

import 'package:dnd_app/domain/repositories/dnd/generics/equipment_repository.dart';

class EquipmentRepositoryImpl extends EquipmentRepository {
  final DndDatasource datasource;

  EquipmentRepositoryImpl(this.datasource);

  @override
  Future<List<Equipment>> getEquipment() async {
    return await datasource.getEquipment();
  }
}
