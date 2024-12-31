import 'package:dnd_app/data/models/dnd/generic_response_dnd.dart';
import 'package:dnd_app/domain/entities/dnd/classes.dart';
import 'package:dnd_app/domain/entities/dnd/magic_items.dart';
import 'package:dnd_app/domain/entities/dnd/monsters.dart';

class DndMappers {
  static Monsters monsterDndToEntity(GenericDndResponse monstersDnd) =>
      Monsters(
        index: monstersDnd.index,
        name: monstersDnd.name,
        url: monstersDnd.url,
      );
  static Classes classesDndToEntity(GenericDndResponse monstersDnd) => Classes(
        index: monstersDnd.index,
        name: monstersDnd.name,
        url: monstersDnd.url,
      );
  static MagicItems magicItemsDndToEntity(GenericDndResponse monstersDnd) =>
      MagicItems(
        index: monstersDnd.index,
        name: monstersDnd.name,
        url: monstersDnd.url,
      );
}
