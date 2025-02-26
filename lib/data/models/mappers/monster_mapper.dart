import 'package:dnd_app/data/models/dnd/class_details.dart';
import 'package:dnd_app/data/models/dnd/classes/my_proficency_choice.dart';
import 'package:dnd_app/data/models/dnd/classes/starting_equipment_options.dart';
import 'package:dnd_app/data/models/dnd/equipment_details.dart';
import 'package:dnd_app/data/models/dnd/feature_details.dart';
import 'package:dnd_app/data/models/dnd/generic_response_dnd.dart';
import 'package:dnd_app/data/models/dnd/classes/level_details/level_details.dart';
import 'package:dnd_app/data/models/dnd/magic_item_details.dart';
import 'package:dnd_app/data/models/dnd/monster_details.dart';
import 'package:dnd_app/data/models/dnd/race_details.dart';
import 'package:dnd_app/data/models/dnd/race_traits_details/race_traits_details.dart';
import 'package:dnd_app/data/models/dnd/spells_details.dart';
import 'package:dnd_app/data/models/dnd/spells_response_dnd.dart';
import 'package:dnd_app/data/models/dnd/subclasses/subclass_details/subclass_details.dart';
import 'package:dnd_app/data/models/dnd/subclasses/subclass_features_details/subclass_features_details.dart';
import 'package:dnd_app/data/models/dnd/subclasses/subclass_levels/subclass_levels_details.dart';
import 'package:dnd_app/domain/entities/dnd/generics/generic_entities.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/class.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/class_levels.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/equipment.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/feature.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/magic_item.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/monster.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/race.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/race_traits.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/spell.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/subclasses/subclass.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/subclasses/subclass_features.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/subclasses/subclass_levels.dart';

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
  static EquipmentGeneric equipmentDndToEntity(
          GenericDndResponse monstersDnd) =>
      EquipmentGeneric(
        index: monstersDnd.index,
        name: monstersDnd.name,
        url: monstersDnd.url,
      );
  static Feats featsDndToEntity(GenericDndResponse monstersDnd) => Feats(
        index: monstersDnd.index,
        name: monstersDnd.name,
        url: monstersDnd.url,
      );
  static Races racesDndToEntity(GenericDndResponse monstersDnd) => Races(
        index: monstersDnd.index,
        name: monstersDnd.name,
        url: monstersDnd.url,
      );
  static Spells spellsDndToEntity(SpellsDndResponse monstersDnd) => Spells(
        index: monstersDnd.index,
        name: monstersDnd.name,
        level: monstersDnd.level,
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
      proficiencies: monster.proficiencies,
      hitDice: monster.hitDice,
      speed: monster.speed,
      senses: monster.senses,
      specialAbilities: monster.specialAbilities,
      conditionImmunities: monster.conditionImmunities,
      damageImmunities: monster.damageImmunities,
      damageResistances: monster.damageResistances,
      damageVulnerabilities: monster.damageVulnerabilities,
      legendaryActions: monster.legendaryActions,
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

  static MagicItem magicItemToEntity(MagicItemDetails magicItem) => MagicItem(
        index: magicItem.index,
        name: magicItem.name,
        equipmentCategory: magicItem.equipmentCategory,
        rarity: magicItem.rarity,
        variants: magicItem.variants,
        variant: magicItem.variant,
        desc: magicItem.desc,
        url: magicItem.url,
        updatedAt: magicItem.updatedAt,
      );
  static Equipment equipemtToEntity(EquipmentDetails equipment) => Equipment(
        desc: equipment.desc,
        special: equipment.special,
        index: equipment.index,
        name: equipment.name,
        equipmentCategory: equipment.equipmentCategory,
        gearCategory: equipment.gearCategory,
        cost: equipment.cost,
        weight: equipment.weight,
        url: equipment.url,
        updatedAt: equipment.updatedAt,
        contents: equipment.contents,
        properties: equipment.properties,
      );

  static Spell spellsToEntity(SpellsDetails spells) => Spell(
      index: spells.index,
      name: spells.name,
      desc: spells.desc,
      higherLevel: spells.higherLevel,
      range: spells.range,
      components: spells.components,
      material: spells.material,
      ritual: spells.ritual,
      duration: spells.duration,
      concentration: spells.concentration,
      castingTime: spells.castingTime,
      level: spells.level,
      attackType: spells.attackType,
      damage: spells.damage,
      school: spells.school,
      classes: spells.classes,
      subclasses: spells.subclasses,
      url: spells.url,
      updatedAt: spells.updatedAt);

  static Race raceToEntity(RaceDetails race) => Race(
      index: race.index,
      name: race.name,
      speed: race.speed,
      abilityBonuses: race.abilityBonuses,
      age: race.age,
      alignment: race.alignment,
      size: race.size,
      sizeDescription: race.sizeDescription,
      startingProficiencies: race.startingProficiencies,
      languages: race.languages,
      languageDesc: race.languageDesc,
      traits: race.traits,
      subraces: race.subraces,
      url: race.url,
      updatedAt: race.updatedAt);

  static Class classToEntity(ClassDetails classes) {
    // Primero, extraemos los detalles que necesitamos de startingEquipmentOptions
    List<MyStartingEquipmentOption>? startingEquipmentOptionsDetails =
        classes.startingEquipmentOptions?.map((option) {
      return MyStartingEquipmentOption(
        desc: option.desc,
        choose: option.choose,
      );
    }).toList();

    List<MyProficiencyChoice>? proficiencyChoicesDetails =
        classes.proficiencyChoices?.map((choice) {
      return MyProficiencyChoice(
          desc: choice.desc, // Extraemos el campo desc
          choose: choice.choose, // Extraemos el campo choose
          options: (choice.from?.options.map((option) {
            return ProficiencyItem.fromJson(
                option.toJson()); // Convertimos las opciones a ProficiencyItem
          }).toList()));
    }).toList();

    return Class(
      index: classes.index,
      name: classes.name,
      hitDie: classes.hitDie,
      proficiencyChoices: proficiencyChoicesDetails,
      proficiencies: classes.proficiencies,
      savingThrows: classes.savingThrows,
      startingEquipment: classes.startingEquipment,
      startingEquipmentOptions:
          startingEquipmentOptionsDetails, // Asignamos la lista simplificada
      classLevels: classes.classLevels,
      multiClassing: classes.multiClassing,
      // spellcasting: classes.spellcasting,
      // spells: classes.spells,
      subclasses: classes.subclasses,
      url: classes.url,
      updatedAt: classes.updatedAt,
    );
  }

  static LevelPerClass levelClassDetalilsToEntity(LevelClassDetails levels) =>
      LevelPerClass(
        level: levels.level,
        abilityScoreBonuses: levels.abilityScoreBonuses,
        profBonus: levels.profBonus,
        features: levels.features,
        spellcasting: levels.spellcasting,
        classSpecific: levels.classSpecific,
        index: levels.index,
        levelDetailsClass: levels.levelDetailsClass,
        url: levels.url,
        updatedAt: levels.updatedAt,
      );
  static Feature featureDetailsToEntity(FeatureDetails features) => Feature(
        desc: features.desc,
        featureClass: features.featureClass,
        index: features.index,
        level: features.level,
        name: features.name,
        prerequisites: features.prerequisites,
        updatedAt: features.updatedAt,
        url: features.url,
      );

  static RaceTrait raceTraitsDetailsToEntity(RaceTraitsDetails traits) =>
      RaceTrait(
        desc: traits.desc,
        index: traits.index,
        name: traits.name,
        proficiencies: traits.proficiencies,
        races: traits.races,
        subraces: traits.subraces,
        updatedAt: traits.updatedAt,
        url: traits.url,
      );

  static Subclass subclassDetailsToEntity(SubclassDetails subclass) => Subclass(
        desc: subclass.desc,
        index: subclass.index,
        name: subclass.name,
        spells: subclass.spells,
        subclassDetailsClass: subclass.subclassDetailsClass,
        subclassFlavor: subclass.subclassFlavor,
        subclassLevels: subclass.subclassLevels,
        updatedAt: subclass.updatedAt,
        url: subclass.url,
      );
  static SubclassFeatures subclassFeaturesDetailsToEntity(
          SubclassFeaturesDetails subclassFeatures) =>
      SubclassFeatures(
        desc: subclassFeatures.desc,
        index: subclassFeatures.index,
        level: subclassFeatures.level,
        name: subclassFeatures.name,
        prerequisites: subclassFeatures.prerequisites,
        subclass: subclassFeatures.subclass,
        subclassFeaturesDetailsClass:
            subclassFeatures.subclassFeaturesDetailsClass,
        updatedAt: subclassFeatures.updatedAt,
        url: subclassFeatures.url,
      );
  static SubclassLevels subclassLevelsDetailsToEntity(
          SubclassLevelsDetails subclassLevels) =>
      SubclassLevels(
        features: subclassLevels.features,
        index: subclassLevels.index,
        level: subclassLevels.level,
        subclass: subclassLevels.subclass,
        subclassLevelsClass: subclassLevels.subclassLevelsClass,
        subclassSpecific: subclassLevels.subclassSpecific,
        updatedAt: subclassLevels.updatedAt,
        url: subclassLevels.url,
      );
}
