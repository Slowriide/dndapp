import 'package:dio/dio.dart';
import 'package:dnd_app/data/models/dnd/dnd_response.dart';
import 'package:dnd_app/data/models/mappers/monster_mapper.dart';
import 'package:dnd_app/domain/entities/dnd/classes.dart';
import 'package:dnd_app/domain/entities/dnd/magic_items.dart';
import 'package:dnd_app/domain/entities/dnd/monsters.dart';

abstract class DndDatasource {
  Future<List<Monsters>> getMonsters();
  Future<List<Classes>> getClasses();
  Future<List<MagicItems>> getMagicItems();
}

class DndDatasourceImpl extends DndDatasource {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://www.dnd5eapi.co/api'),
  );

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
}
