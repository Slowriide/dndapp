import 'package:dnd_app/domain/entities/dnd/specifics/magic_item.dart';

abstract class MagicItemRepository {
  Future<MagicItem> getMagicItem(String id);
}
