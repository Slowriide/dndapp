import 'package:dnd_app/domain/entities/dnd/specifics/magic_item.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/magic_item_repository.dart';
import 'package:dnd_app/service_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final magicItemInfoProvider =
    StateNotifierProvider<MagicItemMapNotifier, Map<String, MagicItem>>(
  (ref) {
    final repository = sl<MagicItemRepository>();

    return MagicItemMapNotifier(getMagicItem: repository.getMagicItem);
  },
);

/*
  {
  'aboleth': Monster(),
  'blue-eyes-White-dragon-': Monster(),
  }
*/

typedef GetMagicItemCallback = Future<MagicItem> Function(String id);

class MagicItemMapNotifier extends StateNotifier<Map<String, MagicItem>> {
  final GetMagicItemCallback getMagicItem;

  MagicItemMapNotifier({required this.getMagicItem}) : super({});

  Future<void> loadMagicItem(String id) async {
    if (state[id] != null) return;
    // ignore: avoid_print
    print('realizando peticion http m');
    final magicItem = await getMagicItem(id);

    state = {...state, id: magicItem};
  }
}
