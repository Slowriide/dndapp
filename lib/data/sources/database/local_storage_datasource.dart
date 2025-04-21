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

  Future<void> toggleEquipmentFavorite(Equipment equipment);
  Future<bool> isEquipmentFavorite(String equipmentId);
  Future<List<Equipment>> loadEquipment({int limit = 10, offset = 0});

  Future<void> toggleClassFavorite(DndClass dndClass);
  Future<bool> isClassFavorite(String dndClassId);
  Future<List<DndClass>> loadClass({int limit = 10, offset = 0});

  Future<void> toggleRaceFavorite(Race race);
  Future<bool> isRaceFavorite(String raceId);
  Future<List<Race>> loadRaces({int limit = 10, offset = 0});

  Future<void> toggleSpellFavorite(Spell spell);
  Future<bool> isSpellFavorite(String spellId);
  Future<List<Spell>> loadSpells({int limit = 10, offset = 0});
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
          EquipmentSchema,
          DndClassSchema,
          RaceSchema,
          SpellSchema,
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

  @override
  Future<bool> isEquipmentFavorite(String equipmentId) async {
    final isar = await db;

    final Equipment? isFavoriteEquipment =
        await isar.equipments.filter().indexEqualTo(equipmentId).findFirst();

    return isFavoriteEquipment != null;
  }

  @override
  Future<List<Equipment>> loadEquipment({int limit = 10, offset = 0}) async {
    final isar = await db;

    return isar.equipments.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<void> toggleEquipmentFavorite(Equipment equipment) async {
    final isar = await db;

    final favoriteEquipment = await isar.equipments
        .filter()
        .indexEqualTo(equipment.index)
        .findFirst();

    if (favoriteEquipment != null) {
      //delete
      isar.writeTxnSync(
        () => isar.equipments.deleteSync(favoriteEquipment.isarId!),
      );
      return;
    }
    //insertar
    isar.writeTxnSync(() => isar.equipments.putSync(equipment));
  }

  @override
  Future<bool> isClassFavorite(String classId) async {
    final isar = await db;

    final DndClass? isFavoriteClass =
        await isar.dndClass.filter().indexEqualTo(classId).findFirst();

    return isFavoriteClass != null;
  }

  @override
  Future<List<DndClass>> loadClass({int limit = 10, offset = 0}) async {
    final isar = await db;

    return isar.dndClass.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<void> toggleClassFavorite(DndClass dndClass) async {
    final isar = await db;

    final favoriteDndClass =
        await isar.dndClass.filter().indexEqualTo(dndClass.index).findFirst();

    if (favoriteDndClass != null) {
      //delete
      isar.writeTxnSync(
        () => isar.dndClass.deleteSync(favoriteDndClass.isarId!),
      );
      return;
    }
    //insertar
    isar.writeTxnSync(() => isar.dndClass.putSync(dndClass));
  }

  @override
  Future<bool> isRaceFavorite(String raceId) async {
    final isar = await db;

    final Race? isFavoriteRace =
        await isar.races.filter().indexEqualTo(raceId).findFirst();

    return isFavoriteRace != null;
  }

  @override
  Future<List<Race>> loadRaces({int limit = 10, offset = 0}) async {
    final isar = await db;

    return isar.races.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<void> toggleRaceFavorite(Race race) async {
    final isar = await db;

    final favoriteRace =
        await isar.races.filter().indexEqualTo(race.index).findFirst();

    if (favoriteRace != null) {
      //delete
      isar.writeTxnSync(
        () => isar.races.deleteSync(favoriteRace.isarId!),
      );
      return;
    }
    //insertar
    isar.writeTxnSync(() => isar.races.putSync(race));
  }

  @override
  Future<bool> isSpellFavorite(String spellId) async {
    final isar = await db;

    final Spell? isFavoriteSpell =
        await isar.spells.filter().indexEqualTo(spellId).findFirst();

    return isFavoriteSpell != null;
  }

  @override
  Future<List<Spell>> loadSpells({int limit = 10, offset = 0}) async {
    final isar = await db;

    return isar.spells.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<void> toggleSpellFavorite(Spell spell) async {
    final isar = await db;

    final favoriteSpell =
        await isar.spells.filter().indexEqualTo(spell.index).findFirst();

    if (favoriteSpell != null) {
      //delete
      isar.writeTxnSync(
        () => isar.spells.deleteSync(favoriteSpell.isarId!),
      );
      return;
    }
    //insertar
    isar.writeTxnSync(() => isar.spells.putSync(spell));
  }
}
