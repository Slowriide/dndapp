import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/equipment.dart';

import 'package:dnd_app/domain/repositories/dnd/specifics/equipment_repository.dart';

class EquipmentCallUserCase implements Usecase<Equipment, String> {
  final EquipmentRepository repository;

  EquipmentCallUserCase(this.repository);
  @override
  Future<Equipment> call({required String params}) async {
    return await repository.getEquipment(params);
  }
}
