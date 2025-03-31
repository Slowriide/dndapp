import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

abstract class LocalStorageDatasource {
  Future<void> toggleFavorite(Monster monster);

  Future<bool> isFavorite(String monsterId);

  Future<List<Monster>> loadMonsters({int limit = 10, offset = 0});
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
        [MonsterSchema],
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
}
