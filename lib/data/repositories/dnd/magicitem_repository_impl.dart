import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/magic_item.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/magic_item_repository.dart';

class MagicitemRepositoryImpl extends MagicItemRepository {
  final DndDatasource datasource;

  MagicitemRepositoryImpl(this.datasource);

  @override
  Future<MagicItem> getMagicItem(String id) async {
    return await datasource.getMagicItem(id);
  }
}
