import 'package:dnd_app/domain/entities/dnd/magic_items.dart';

abstract class MagicItemsRepository {
  Future<List<MagicItems>> getMagicItems();
}
