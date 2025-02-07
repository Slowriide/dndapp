import 'package:dnd_app/domain/entities/dnd/generics/magic_items.dart';

abstract class MagicItemsRepository {
  Future<List<MagicItems>> getMagicItems();
}
