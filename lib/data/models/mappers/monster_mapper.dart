import 'package:dnd_app/data/models/dnd/generic_response_dnd.dart';
import 'package:dnd_app/data/models/dnd/monster_details.dart';
import 'package:dnd_app/domain/entities/dnd/classes.dart';
import 'package:dnd_app/domain/entities/dnd/magic_items.dart';
import 'package:dnd_app/domain/entities/dnd/monsters.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';

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

  static Monster monsterToEntity(MonsterDetails monster) => Monster(
      actions: monster.actions,
      alignment: monster.alignment,
      id: monster.id,
      name: monster.name,
      size: monster.size,
      type: monster.type,
      armorClass: monster.armorClass,
      hitPoints: monster.hitPoints,
      hitPointsRoll: monster.hitPointsRoll,
      hitDice: monster.hitDice,
      speed: monster.speed,
      senses: monster.senses,
      strength: monster.strength,
      dexterity: monster.dexterity,
      constitution: monster.constitution,
      intelligence: monster.intelligence,
      wisdom: monster.wisdom,
      charisma: monster.charisma,
      languages: monster.languages,
      challengeRating: monster.challengeRating,
      proficiencyBonus: monster.proficiencyBonus,
      xp: monster.xp,
      image: (monster.image != '')
          ? 'https://www.dnd5eapi.co ${monster.image}'
          : 'https://i.sstatic.net/KsHbF.jpg',
      url: (monster.url != '') ? 'https://www.dnd5eapi.co${monster.url}' : '');
}
