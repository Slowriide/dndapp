import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/specifics_entities.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

abstract class LocalStorageDatasource {
  Future<void> toggleFavorite(Monster monster);
  Future<bool> isFavorite(String monsterId);
  Future<List<Monster>> loadMonsters({int limit = 10, offset = 0});

  Future<void> toggleMagicItemFavorite(MagicItem magicItem);
  Future<bool> isMagicItemFavorite(String magicItemId);
  Future<List<MagicItem>> loadMagicItems({int limit = 10, offset = 0});
}

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          MonsterSchema,
          MagicItemSchema,
        ],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isFavorite(String monsterId) async {
    final isar = await db;

    final Monster? isFavoriteMonster =
        await isar.monsters.filter().idEqualTo(monsterId).findFirst();

    return isFavoriteMonster != null;
  }

  @override
  Future<void> toggleFavorite(Monster monster) async {
    final isar = await db;

    final favoriteMonster =
        await isar.monsters.filter().idEqualTo(monster.id).findFirst();

    if (favoriteMonster != null) {
      //delete
      isar.writeTxnSync(
        () => isar.monsters.deleteSync(favoriteMonster.IsarId!),
      );
      return;
    }
    //insertar
    isar.writeTxnSync(() => isar.monsters.putSync(monster));
  }

  @override
  Future<List<Monster>> loadMonsters({int limit = 10, offset = 0}) async {
    final isar = await db;

    return isar.monsters.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<bool> isMagicItemFavorite(String magicItemId) async {
    final isar = await db;

    final MagicItem? isFavoriteMagicItem =
        await isar.magicItems.filter().indexEqualTo(magicItemId).findFirst();

    return isFavoriteMagicItem != null;
  }

  @override
  Future<List<MagicItem>> loadMagicItems({int limit = 10, offset = 0}) async {
    final isar = await db;

    return isar.magicItems.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<void> toggleMagicItemFavorite(MagicItem magicItem) async {
    final isar = await db;

    final favoriteMagicItem = await isar.magicItems
        .filter()
        .indexEqualTo(magicItem.index)
        .findFirst();

    if (favoriteMagicItem != null) {
      //delete
      isar.writeTxnSync(
        () => isar.magicItems.deleteSync(favoriteMagicItem.IsarId!),
      );
      return;
    }
    //insertar
    isar.writeTxnSync(() => isar.magicItems.putSync(magicItem));
  }
}
