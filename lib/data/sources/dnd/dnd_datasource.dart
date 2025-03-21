import 'package:dio/dio.dart';
import 'package:dnd_app/data/models/dnd/class_details.dart';
import 'package:dnd_app/data/models/dnd/feature_details.dart';
import 'package:dnd_app/data/models/dnd/dnd_response.dart';
import 'package:dnd_app/data/models/dnd/dnd_spells_response.dart';
import 'package:dnd_app/data/models/dnd/equipment_details.dart';
import 'package:dnd_app/data/models/dnd/classes/level_details/level_details.dart';
import 'package:dnd_app/data/models/dnd/magic_item_details.dart';
import 'package:dnd_app/data/models/dnd/monster_details.dart';
import 'package:dnd_app/data/models/dnd/race/subrace/subrace_details/subrace_details.dart';
import 'package:dnd_app/data/models/dnd/race/subrace/subrace_trait/subrace_trait_details.dart';
import 'package:dnd_app/data/models/dnd/race_details.dart';
import 'package:dnd_app/data/models/dnd/race_traits_details/race_traits_details.dart';
import 'package:dnd_app/data/models/dnd/spells_details.dart';
import 'package:dnd_app/data/models/dnd/subclasses/subclass_details/subclass_details.dart';
import 'package:dnd_app/data/models/dnd/subclasses/subclass_features_details/subclass_features_details.dart';
import 'package:dnd_app/data/models/dnd/subclasses/subclass_levels/subclass_levels_details.dart';
import 'package:dnd_app/data/models/mappers/monster_mapper.dart';
import 'package:dnd_app/domain/entities/dnd/generics/generic_entities.dart';

import 'package:dnd_app/domain/entities/dnd/specifics/specifics_entities.dart';

abstract class DndDatasource {
  Future<List<Monsters>> getMonsters();
  Future<List<Classes>> getClasses();
  Future<List<MagicItems>> getMagicItems();
  Future<List<EquipmentGeneric>> getEquipmentGeneric();
  Future<List<Feats>> getFeats();
  Future<List<Races>> getRaces();
  Future<List<Spells>> getSpells();

  Future<Monster> getMonster(String id);
  Future<MagicItem> getMagicItem(String id);
  Future<Equipment> getEquipment(String id);
  Future<Spell> getSpell(String id);
  Future<Race> getRace(String id);
  Future<Class> getClass(String id);

  Future<List<LevelPerClass>> getLevelsPerClass(String id);
  Future<List<Feature>> getFeature(String id);
  Future<List<RaceTrait>> getRaceTrait(String id);
  Future<Subclass> getSubclass(String id);
  Future<List<SubclassFeatures>> getSubclassFeatures(String id);
  Future<List<SubclassLevels>> getSubclassLevels(String id);
  Future<Subrace> getSubrace(String id);
  Future<List<SubraceTraits>> getSubraceTraits(String id);
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
  Future<List<EquipmentGeneric>> getEquipmentGeneric() async {
    try {
      final response = await dio.get('/equipment');

      final dndResponse = ApiResponse.fromJson(response.data);

      final List<EquipmentGeneric> equipment = dndResponse.results
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

  @override
  Future<MagicItem> getMagicItem(String id) async {
    try {
      final response = await dio.get('/magic-items/$id');

      final dndResponse = MagicItemDetails.fromJson(response.data);

      // print('Monster data: ${response.data}');

      final MagicItem magicItem = DndMappers.magicItemToEntity(dndResponse);
      // ignore: avoid_print
      // print('monster image: ${magicItem.desc}');

      if (response.statusCode == 200 && response.data != null) {
        return magicItem;
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
  Future<Equipment> getEquipment(String id) async {
    try {
      final response = await dio.get('/equipment/$id');

      final dndResponse = EquipmentDetails.fromJson(response.data);

      // print('Monster data: ${response.data}');

      final Equipment equipment = DndMappers.equipemtToEntity(dndResponse);
      // ignore: avoid_print
      print('monster image: ${equipment.equipmentCategory}');

      if (response.statusCode == 200 && response.data != null) {
        return equipment;
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
  Future<Spell> getSpell(String id) async {
    try {
      final response = await dio.get('/spells/$id');

      final dndResponse = SpellsDetails.fromJson(response.data);

      // print('Monster data: ${response.data}');

      final Spell spell = DndMappers.spellsToEntity(dndResponse);
      // ignore: avoid_print
      print('monster image: ${spell.desc}');

      if (response.statusCode == 200 && response.data != null) {
        return spell;
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
  Future<Race> getRace(String id) async {
    try {
      final response = await dio.get('/races/$id');

      final dndResponse = RaceDetails.fromJson(response.data);

      // print('Monster data: ${response.data}');

      final Race race = DndMappers.raceToEntity(dndResponse);
      // ignore: avoid_print
      print('monster image: ${race.name}');

      if (response.statusCode == 200 && response.data != null) {
        return race;
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
  Future<Class> getClass(String id) async {
    try {
      final response = await dio.get('/classes/$id');
      // log("JSON recibido: $response");

      final dndResponse = ClassDetails.fromMap(response.data);

      // print('Monster data: ${response.data}');
      final Class classes = DndMappers.classToEntity(dndResponse);
      // ignore: avoid_print

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
  Future<List<LevelPerClass>> getLevelsPerClass(String id) async {
    try {
      final response = await dio.get('/classes/$id/levels');

      if (response.statusCode == 200 && response.data != null) {
        // log("JSON recibido: $response");
        final List<dynamic> dataList =
            response.data; // Asegurar que es una lista

        final List<LevelPerClass> levels = dataList
            .map((item) => DndMappers.levelClassDetalilsToEntity(
                LevelClassDetails.fromMap(item)))
            .toList();

        return levels;
      } else {
        throw Exception('Ocurrió un error en la comunicación');
      }
    } catch (e) {
      // print('Error al obtener niveles de clase: $e');
      throw Exception('Falló');
    }
  }

  @override
  Future<List<Feature>> getFeature(String id) async {
    try {
      final response = await dio.get('/classes/$id/features');
      final List<dynamic> featuresList = response.data['results'];

      List<Feature> features = [];

      for (var feature in featuresList) {
        final featureResponse =
            await dio.get(feature["url"].replaceFirst("/api", ""));

        final featureDetails = FeatureDetails.fromMap(featureResponse.data);

        final featureEntity = DndMappers.featureDetailsToEntity(featureDetails);
        features.add(featureEntity);
      }
      return features;
    } catch (e) {
      // print('Error al obtener niveles de clase: $e');
      throw Exception('Falló');
    }
  }

  @override
  Future<List<RaceTrait>> getRaceTrait(String id) async {
    try {
      final response = await dio.get('/races/$id/traits');
      final List<dynamic> traitsList = response.data['results'];

      List<RaceTrait> traits = [];

      for (var trait in traitsList) {
        final traitResponse =
            await dio.get(trait["url"].replaceFirst("/api", ""));

        final traitsDetails = RaceTraitsDetails.fromMap(traitResponse.data);

        final traitEntity = DndMappers.raceTraitsDetailsToEntity(traitsDetails);
        traits.add(traitEntity);
      }
      return traits;
    } catch (e) {
      // print('Error al obtener niveles de clase: $e');
      throw Exception('Falló');
    }
  }

  @override
  Future<Subclass> getSubclass(String id) async {
    try {
      final response = await dio.get('/subclasses/$id');
      // log("JSON recibido: $response");

      final dndResponse = SubclassDetails.fromMap(response.data);

      // print('Monster data: ${response.data}');
      final Subclass classes = DndMappers.subclassDetailsToEntity(dndResponse);
      // ignore: avoid_print

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
  Future<List<SubclassFeatures>> getSubclassFeatures(String id) async {
    try {
      final response = await dio.get('/features/$id');

      if (response.statusCode == 200 && response.data != null) {
        // log("JSON recibido: $response");
        // La API devuelve un objeto, lo convertimos en una lista de un solo elemento
        final List<dynamic> dataList = [response.data];

        final List<SubclassFeatures> features = dataList
            .map((item) => DndMappers.subclassFeaturesDetailsToEntity(
                SubclassFeaturesDetails.fromMap(item)))
            .toList();

        return features;
      } else {
        throw Exception('Ocurrió un error en la comunicación');
      }
    } catch (e) {
      // print('Error al obtener niveles de clase: $e');
      throw Exception('Falló');
    }
  }

  @override
  Future<List<SubclassLevels>> getSubclassLevels(String id) async {
    try {
      final response = await dio.get('/subclasses/$id/levels');

      if (response.statusCode == 200 && response.data != null) {
        // log("JSON recibido: $response");
        final List<dynamic> dataList =
            response.data; // Asegurar que es una lista

        final List<SubclassLevels> levels = dataList
            .map((item) => DndMappers.subclassLevelsDetailsToEntity(
                SubclassLevelsDetails.fromMap(item)))
            .toList();

        return levels;
      } else {
        throw Exception('Ocurrió un error en la comunicación');
      }
    } catch (e) {
      // print('Error al obtener niveles de clase: $e');
      throw Exception('Falló');
    }
  }

  @override
  Future<Subrace> getSubrace(String id) async {
    try {
      final response = await dio.get('/subraces/$id');
      // log("JSON recibido: $response");

      final dndResponse = SubraceDetails.fromMap(response.data);

      // print('Monster data: ${response.data}');
      final Subrace subraces = DndMappers.subraceDetailsToEntity(dndResponse);
      // ignore: avoid_print

      if (response.statusCode == 200 && response.data != null) {
        return subraces;
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
  Future<List<SubraceTraits>> getSubraceTraits(String id) async {
    try {
      final response = await dio.get('/traits/$id');

      if (response.statusCode == 200 && response.data != null) {
        // log("JSON recibido: $response");
        final List<dynamic> dataList = [response.data];

        final List<SubraceTraits> traits = dataList
            .map((item) => DndMappers.subraceTraitsDetailsToEntity(
                SubraceTraitDetails.fromMap(item)))
            .toList();

        return traits;
      } else {
        throw Exception('Ocurrió un error en la comunicación');
      }
    } catch (e) {
      // print('Error al obtener niveles de clase: $e');
      throw Exception('Falló');
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
