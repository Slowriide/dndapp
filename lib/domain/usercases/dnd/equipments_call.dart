import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/domain/entities/dnd/generics/generic_entities.dart';

import 'package:dnd_app/domain/repositories/dnd/generics/equipment_repository.dart';

class EquipmentGenericCallUserCase
    implements Usecase<List<EquipmentGeneric>, void> {
  final EquipmentGenericRepository repository;

  EquipmentGenericCallUserCase(this.repository);
  @override
  Future<List<EquipmentGeneric>> call({void params}) async {
    return await repository.getEquipmentGeneric();
  }
}
