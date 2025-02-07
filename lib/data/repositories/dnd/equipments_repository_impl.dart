import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/generics/equipments.dart';

import 'package:dnd_app/domain/repositories/dnd/generics/equipment_repository.dart';

class EquipmentGenericRepositoryImpl extends EquipmentGenericRepository {
  final DndDatasource datasource;

  EquipmentGenericRepositoryImpl(this.datasource);

  @override
  Future<List<EquipmentGeneric>> getEquipmentGeneric() async {
    return await datasource.getEquipmentGeneric();
  }
}
