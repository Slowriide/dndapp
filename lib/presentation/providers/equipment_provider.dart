import 'package:dnd_app/domain/entities/dnd/specifics/equipment.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/magic_item.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/magic_item_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/monster_repository%20copy.dart';
import 'package:dnd_app/service_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final equipmentInfoProvider =
    StateNotifierProvider<EquipmentMapNotifier, Map<String, Equipment>>(
  (ref) {
    final repository = sl<EquipmentRepository>();

    return EquipmentMapNotifier(getEquipment: repository.getEquipment);
  },
);

/*
  {
  'aboleth': Monster(),
  'blue-eyes-White-dragon-': Monster(),
  }
*/

typedef GetEquipmentCallback = Future<Equipment> Function(String id);

class EquipmentMapNotifier extends StateNotifier<Map<String, Equipment>> {
  final GetEquipmentCallback getEquipment;

  EquipmentMapNotifier({required this.getEquipment}) : super({});

  Future<void> loadEquipment(String id) async {
    if (state[id] != null) return;
    // ignore: avoid_print
    print('realizando peticion http e');
    final equipment = await getEquipment(id);

    state = {...state, id: equipment};
  }
}
