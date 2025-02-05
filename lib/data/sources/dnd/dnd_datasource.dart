import 'package:dio/dio.dart';
import 'package:dnd_app/data/models/dnd/dnd_response.dart';
import 'package:dnd_app/data/models/dnd/dnd_spells_response.dart';
import 'package:dnd_app/data/models/dnd/monster_details.dart';
import 'package:dnd_app/data/models/mappers/monster_mapper.dart';
import 'package:dnd_app/domain/entities/dnd/generics/generic_entities.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';

abstract class DndDatasource {
  Future<List<Monsters>> getMonsters();
  Future<List<Classes>> getClasses();
  Future<List<MagicItems>> getMagicItems();
  Future<List<Equipment>> getEquipment();
  Future<List<Feats>> getFeats();
  Future<List<Races>> getRaces();
  Future<List<Spells>> getSpells();

  Future<Monster> getMonster(String id);
}

class DndDatasourceImpl extends DndDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://www.dnd5eapi.co/api',
    ),
  );

  ///* G E N E R I C S

  @override
  Future<List<Monsters>> getMonsters() async {
    try {
      final response = await dio.get('/monsters');

      final dndResponse = ApiResponse.fromJson(response.data);

      final List<Monsters> monsters = dndResponse.results
          .map((dndResponse) => DndMappers.monsterDndToEntity(dndResponse))
          .toList();

      if (response.statusCode == 200 && response.data != null) {
        return monsters;
      } else {
        throw Exception('Ocurrio un error en la comunicacion');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error al obtener monstruos: $e');
      throw Exception('fallo');
    }
  }

  @override
  Future<List<Classes>> getClasses() async {
    try {
      final response = await dio.get('/classes');

      final dndResponse = ApiResponse.fromJson(response.data);

      final List<Classes> classes = dndResponse.results
          .map((dndResponse) => DndMappers.classesDndToEntity(dndResponse))
          .toList();

      if (response.statusCode == 200 && response.data != null) {
        return classes;
      } else {
        throw Exception('Ocurrio un error en la comunicacion');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error al obtener monstruos: $e');
      throw Exception('fallo');
    }
  }

  @override
  Future<List<MagicItems>> getMagicItems() async {
    try {
      final response = await dio.get('/magic-items');

      final dndResponse = ApiResponse.fromJson(response.data);

      final List<MagicItems> magicItems = dndResponse.results
          .map((dndResponse) => DndMappers.magicItemsDndToEntity(dndResponse))
          .toList();

      if (response.statusCode == 200 && response.data != null) {
        return magicItems;
      } else {
        throw Exception('Ocurrio un error en la comunicacion');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error al obtener monstruos: $e');
      throw Exception('fallo');
    }
  }

  @override
  Future<List<Equipment>> getEquipment() async {
    try {
      final response = await dio.get('/equipment');

      final dndResponse = ApiResponse.fromJson(response.data);

      final List<Equipment> equipment = dndResponse.results
          .map((dndResponse) => DndMappers.equipmentDndToEntity(dndResponse))
          .toList();

      if (response.statusCode == 200 && response.data != null) {
        return equipment;
      } else {
        throw Exception('Ocurrio un error en la comunicacion');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error al obtener el equipo: $e');
      throw Exception('fallo');
    }
  }

  @override
  Future<List<Feats>> getFeats() async {
    try {
      final response = await dio.get('/feats');

      final dndResponse = ApiResponse.fromJson(response.data);

      final List<Feats> feats = dndResponse.results
          .map((dndResponse) => DndMappers.featsDndToEntity(dndResponse))
          .toList();

      if (response.statusCode == 200 && response.data != null) {
        return feats;
      } else {
        throw Exception('Ocurrio un error en la comunicacion');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error al obtener feats: $e');
      throw Exception('fallo');
    }
  }

  @override
  Future<List<Races>> getRaces() async {
    try {
      final response = await dio.get('/races');

      final dndResponse = ApiResponse.fromJson(response.data);

      final List<Races> races = dndResponse.results
          .map((dndResponse) => DndMappers.racesDndToEntity(dndResponse))
          .toList();

      if (response.statusCode == 200 && response.data != null) {
        return races;
      } else {
        throw Exception('Ocurrio un error en la comunicacion');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error al obtener races: $e');
      throw Exception('fallo');
    }
  }

  @override
  Future<List<Spells>> getSpells() async {
    try {
      final response = await dio.get('/spells');

      final spellsResponse = SpellsResponse.fromJson(response.data);

      final List<Spells> spells = spellsResponse.results
          .map((spellsResponse) => DndMappers.spellsDndToEntity(spellsResponse))
          .toList();

      if (response.statusCode == 200 && response.data != null) {
        return spells;
      } else {
        throw Exception('Ocurrio un error en la comunicacion');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error al obtener spells: $e');
      throw Exception('fallo');
    }
  }

  ///* S P E C I F I C S

  @override
  Future<Monster> getMonster(String id) async {
    try {
      final response = await dio.get('/monsters/$id');

      final dndResponse = MonsterDetails.fromJson(response.data);

      // print('Monster data: ${response.data}');

      final Monster monster = DndMappers.monsterToEntity(dndResponse);
      // ignore: avoid_print
      print('monster image: ${monster.specialAbilities}');

      if (response.statusCode == 200 && response.data != null) {
        return monster;
      } else {
        throw Exception('Ocurrio un error en la comunicacion');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error al obtener monstruos: $e');
      throw Exception('fallo');
    }
  }
  // @override
  // Future<Monster> getMonster(String id) async {
  //   try {
  //     // Llamada a la API
  //     final response = await dio.get('/monsters/$id');

  //     // Registro de la respuesta
  //     print('Response status code: ${response.statusCode}');
  //     print('Response data: ${response.data}');

  //     // Mapeo de la respuesta a MonsterDetails
  //     final dndResponse = MonsterDetails.fromJson(response.data);

  //     // Conversión de MonsterDetails a Monster
  //     final Monster monster = DndMappers.monsterToEntity(dndResponse);

  //     // Validación de la respuesta
  //     if (response.statusCode == 200 && response.data != null) {
  //       return monster;
  //     } else {
  //       throw Exception(
  //           'Error en la comunicación con el servidor: Código ${response.statusCode}');
  //     }
  //   } catch (e, stackTrace) {
  //     // Captura de errores con trazabilidad
  //     print('Error al obtener monstruos: $e');
  //     print('StackTrace: $stackTrace');
  //     throw Exception('Error al obtener monstruos: $e');
  //   }
  // }
}
