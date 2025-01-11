import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';
import 'package:dnd_app/domain/entities/dnd/magic_items.dart';
import 'package:dnd_app/domain/repositories/dnd/magic_items_repository.dart';

class MagicitemsRepositoryImpl extends MagicItemsRepository {
  final DndDatasource datasource;

  MagicitemsRepositoryImpl(this.datasource);

  @override
  Future<List<MagicItems>> getMagicItems() async {
    return await datasource.getMagicItems();
  }
}
