import 'package:dnd_app/data/repositories/storage/equipment_storage_repository.dart';

import 'package:dnd_app/domain/entities/dnd/specifics/equipment.dart';
import 'package:dnd_app/presentation/providers/db/local_storage_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteEquipmentProvider =
    StateNotifierProvider<StorageEquipmentNotifier, Map<String, Equipment>>(
        (ref) {
  final equipmentStorageRepository =
      ref.watch(equipmentStorageRepositoryProvider);

  return StorageEquipmentNotifier(
    localStorageRepository: equipmentStorageRepository,
  );
});

class StorageEquipmentNotifier extends StateNotifier<Map<String, Equipment>> {
  int page = 0;
  final EquipmentStorageRepository localStorageRepository;

  StorageEquipmentNotifier({required this.localStorageRepository}) : super({});

  Future<List<Equipment>> loadNextPage() async {
    final equipmentList = await localStorageRepository.loadEquipment(
        offset: page * 10, limit: 20);
    page++;

    final tempEquipmentMap = <String, Equipment>{};
    for (final equipment in equipmentList) {
      tempEquipmentMap[equipment.index] = equipment;
    }

    state = {...state, ...tempEquipmentMap};

    return equipmentList;
  }

  Future<void> toggleFavorite(Equipment equipment) async {
    await localStorageRepository.toggleEquipmentFavorite(equipment);
    final bool isInFavorites = state[equipment.index] != null;
    if (isInFavorites) {
      state.remove(equipment.index);
      state = {...state};
    } else {
      state = {...state, equipment.index: equipment};
    }
  }
}
