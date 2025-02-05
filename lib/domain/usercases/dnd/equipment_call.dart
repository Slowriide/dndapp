import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/domain/entities/dnd/generics/generic_entities.dart';

import 'package:dnd_app/domain/repositories/dnd/equipment_repository.dart';

class EquipmentCallUserCase implements Usecase<List<Equipment>, void> {
  final EquipmentRepository repository;

  EquipmentCallUserCase(this.repository);
  @override
  Future<List<Equipment>> call({void params}) async {
    return await repository.getEquipment();
  }
}
