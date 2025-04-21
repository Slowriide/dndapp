import 'package:dnd_app/data/repositories/storage/classes_storage_repository.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/dnd_class.dart';
import 'package:dnd_app/presentation/providers/db/local_storage_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteDndClassesProvider =
    StateNotifierProvider<StorageDndClassesNotifier, Map<String, DndClass>>(
        (ref) {
  final dndClassStorageRepository = ref.watch(classesStorageRepositoryProvider);

  return StorageDndClassesNotifier(
    localStorageRepository: dndClassStorageRepository,
  );
});

class StorageDndClassesNotifier extends StateNotifier<Map<String, DndClass>> {
  int page = 0;
  final ClassesStorageRepository localStorageRepository;

  StorageDndClassesNotifier({required this.localStorageRepository}) : super({});

  Future<List<DndClass>> loadNextPage() async {
    final classList = await localStorageRepository.loadClasses(
      offset: page * 10,
      limit: 20,
    );
    page++;

    final tempClassMap = <String, DndClass>{};
    for (final dndClass in classList) {
      tempClassMap[dndClass.index!] = dndClass;
    }

    state = {...state, ...tempClassMap};

    return classList;
  }

  Future<void> toggleFavorite(DndClass dndClass) async {
    await localStorageRepository.toggleClassesFavorite(dndClass);
    final bool isInFavorites = state[dndClass.index] != null;
    if (isInFavorites) {
      state.remove(dndClass.index);
      state = {...state};
    } else {
      state = {...state, dndClass.index!: dndClass};
    }
  }
}
