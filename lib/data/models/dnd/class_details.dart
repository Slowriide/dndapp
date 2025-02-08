// To parse this JSON data, do
//
//     final classDetails = classDetailsFromJson(jsonString);

import 'dart:convert';

ClassDetails classDetailsFromJson(String str) =>
    ClassDetails.fromJson(json.decode(str));

String classDetailsToJson(ClassDetails data) => json.encode(data.toJson());

class ClassDetails {
  final String index;
  final String name;
  final int hitDie;
  final List<ProficiencyChoice> proficiencyChoices;
  final List<Proficiency> proficiencies;
  final List<Proficiency> savingThrows;
  final List<StartingEquipment> startingEquipment;
  final List<StartingEquipmentOption> startingEquipmentOptions;
  final String classLevels;
  final MultiClassing multiClassing;
  final List<Proficiency> subclasses;
  final Spellcasting spellcasting;
  final String spells;
  final String url;
  final DateTime updatedAt;

  ClassDetails({
    required this.index,
    required this.name,
    required this.hitDie,
    required this.proficiencyChoices,
    required this.proficiencies,
    required this.savingThrows,
    required this.startingEquipment,
    required this.startingEquipmentOptions,
    required this.classLevels,
    required this.multiClassing,
    required this.subclasses,
    required this.spellcasting,
    required this.spells,
    required this.url,
    required this.updatedAt,
  });

  factory ClassDetails.fromJson(Map<String, dynamic> json) => ClassDetails(
        index: json["index"],
        name: json["name"],
        hitDie: json["hit_die"],
        proficiencyChoices: List<ProficiencyChoice>.from(
            json["proficiency_choices"]
                .map((x) => ProficiencyChoice.fromJson(x))),
        proficiencies: List<Proficiency>.from(
            json["proficiencies"].map((x) => Proficiency.fromJson(x))),
        savingThrows: List<Proficiency>.from(
            json["saving_throws"].map((x) => Proficiency.fromJson(x))),
        startingEquipment: List<StartingEquipment>.from(
            json["starting_equipment"]
                .map((x) => StartingEquipment.fromJson(x))),
        startingEquipmentOptions: List<StartingEquipmentOption>.from(
            json["starting_equipment_options"]
                .map((x) => StartingEquipmentOption.fromJson(x))),
        classLevels: json["class_levels"],
        multiClassing: MultiClassing.fromJson(json["multi_classing"]),
        subclasses: List<Proficiency>.from(
            json["subclasses"].map((x) => Proficiency.fromJson(x))),
        spellcasting: Spellcasting.fromJson(json["spellcasting"]),
        spells: json["spells"],
        url: json["url"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "name": name,
        "hit_die": hitDie,
        "proficiency_choices":
            List<dynamic>.from(proficiencyChoices.map((x) => x.toJson())),
        "proficiencies":
            List<dynamic>.from(proficiencies.map((x) => x.toJson())),
        "saving_throws":
            List<dynamic>.from(savingThrows.map((x) => x.toJson())),
        "starting_equipment":
            List<dynamic>.from(startingEquipment.map((x) => x.toJson())),
        "starting_equipment_options":
            List<dynamic>.from(startingEquipmentOptions.map((x) => x.toJson())),
        "class_levels": classLevels,
        "multi_classing": multiClassing.toJson(),
        "subclasses": List<dynamic>.from(subclasses.map((x) => x.toJson())),
        "spellcasting": spellcasting.toJson(),
        "spells": spells,
        "url": url,
        "updated_at": updatedAt.toIso8601String(),
      };
}

class MultiClassing {
  final List<Prerequisite> prerequisites;
  final List<Proficiency> proficiencies;
  final List<ProficiencyChoice> proficiencyChoices;

  MultiClassing({
    required this.prerequisites,
    required this.proficiencies,
    required this.proficiencyChoices,
  });

  factory MultiClassing.fromJson(Map<String, dynamic> json) => MultiClassing(
        prerequisites: List<Prerequisite>.from(
            json["prerequisites"].map((x) => Prerequisite.fromJson(x))),
        proficiencies: List<Proficiency>.from(
            json["proficiencies"].map((x) => Proficiency.fromJson(x))),
        proficiencyChoices: List<ProficiencyChoice>.from(
            json["proficiency_choices"]
                .map((x) => ProficiencyChoice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "prerequisites":
            List<dynamic>.from(prerequisites.map((x) => x.toJson())),
        "proficiencies":
            List<dynamic>.from(proficiencies.map((x) => x.toJson())),
        "proficiency_choices":
            List<dynamic>.from(proficiencyChoices.map((x) => x.toJson())),
      };
}

class Prerequisite {
  final Proficiency abilityScore;
  final int minimumScore;

  Prerequisite({
    required this.abilityScore,
    required this.minimumScore,
  });

  factory Prerequisite.fromJson(Map<String, dynamic> json) => Prerequisite(
        abilityScore: Proficiency.fromJson(json["ability_score"]),
        minimumScore: json["minimum_score"],
      );

  Map<String, dynamic> toJson() => {
        "ability_score": abilityScore.toJson(),
        "minimum_score": minimumScore,
      };
}

class Proficiency {
  final String index;
  final String name;
  final String url;

  Proficiency({
    required this.index,
    required this.name,
    required this.url,
  });

  factory Proficiency.fromJson(Map<String, dynamic> json) => Proficiency(
        index: json["index"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "name": name,
        "url": url,
      };
}

class ProficiencyChoice {
  final String desc;
  final int choose;
  final String type;
  final ProficiencyChoiceFrom from;

  ProficiencyChoice({
    required this.desc,
    required this.choose,
    required this.type,
    required this.from,
  });

  factory ProficiencyChoice.fromJson(Map<String, dynamic> json) =>
      ProficiencyChoice(
        desc: json["desc"],
        choose: json["choose"],
        type: json["type"],
        from: ProficiencyChoiceFrom.fromJson(json["from"]),
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "choose": choose,
        "type": type,
        "from": from.toJson(),
      };
}

class ProficiencyChoiceFrom {
  final String optionSetType;
  final List<PurpleOption> options;

  ProficiencyChoiceFrom({
    required this.optionSetType,
    required this.options,
  });

  factory ProficiencyChoiceFrom.fromJson(Map<String, dynamic> json) =>
      ProficiencyChoiceFrom(
        optionSetType: json["option_set_type"],
        options: List<PurpleOption>.from(
            json["options"].map((x) => PurpleOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "option_set_type": optionSetType,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };
}

class PurpleOption {
  final OptionType optionType;
  final Proficiency item;

  PurpleOption({
    required this.optionType,
    required this.item,
  });

  factory PurpleOption.fromJson(Map<String, dynamic> json) => PurpleOption(
        optionType: optionTypeValues.map[json["option_type"]]!,
        item: Proficiency.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "option_type": optionTypeValues.reverse[optionType],
        "item": item.toJson(),
      };
}

enum OptionType { REFERENCE }

final optionTypeValues = EnumValues({"reference": OptionType.REFERENCE});

class Spellcasting {
  final int level;
  final Proficiency spellcastingAbility;
  final List<Info> info;

  Spellcasting({
    required this.level,
    required this.spellcastingAbility,
    required this.info,
  });

  factory Spellcasting.fromJson(Map<String, dynamic> json) => Spellcasting(
        level: json["level"],
        spellcastingAbility: Proficiency.fromJson(json["spellcasting_ability"]),
        info: List<Info>.from(json["info"].map((x) => Info.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "level": level,
        "spellcasting_ability": spellcastingAbility.toJson(),
        "info": List<dynamic>.from(info.map((x) => x.toJson())),
      };
}

class Info {
  final String name;
  final List<String> desc;

  Info({
    required this.name,
    required this.desc,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        name: json["name"],
        desc: List<String>.from(json["desc"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "desc": List<dynamic>.from(desc.map((x) => x)),
      };
}

class StartingEquipment {
  final Proficiency equipment;
  final int quantity;

  StartingEquipment({
    required this.equipment,
    required this.quantity,
  });

  factory StartingEquipment.fromJson(Map<String, dynamic> json) =>
      StartingEquipment(
        equipment: Proficiency.fromJson(json["equipment"]),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "equipment": equipment.toJson(),
        "quantity": quantity,
      };
}

class StartingEquipmentOption {
  final String desc;
  final int choose;
  final String type;
  final StartingEquipmentOptionFrom from;

  StartingEquipmentOption({
    required this.desc,
    required this.choose,
    required this.type,
    required this.from,
  });

  factory StartingEquipmentOption.fromJson(Map<String, dynamic> json) =>
      StartingEquipmentOption(
        desc: json["desc"],
        choose: json["choose"],
        type: json["type"],
        from: StartingEquipmentOptionFrom.fromJson(json["from"]),
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "choose": choose,
        "type": type,
        "from": from.toJson(),
      };
}

class StartingEquipmentOptionFrom {
  final String optionSetType;
  final List<FluffyOption> options;

  StartingEquipmentOptionFrom({
    required this.optionSetType,
    required this.options,
  });

  factory StartingEquipmentOptionFrom.fromJson(Map<String, dynamic> json) =>
      StartingEquipmentOptionFrom(
        optionSetType: json["option_set_type"],
        options: List<FluffyOption>.from(
            json["options"].map((x) => FluffyOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "option_set_type": optionSetType,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };
}

class FluffyOption {
  final String optionType;
  final int? count;
  final Proficiency? of;
  final Choice? choice;

  FluffyOption({
    required this.optionType,
    this.count,
    this.of,
    this.choice,
  });

  factory FluffyOption.fromJson(Map<String, dynamic> json) => FluffyOption(
        optionType: json["option_type"],
        count: json["count"],
        of: json["of"] == null ? null : Proficiency.fromJson(json["of"]),
        choice: json["choice"] == null ? null : Choice.fromJson(json["choice"]),
      );

  Map<String, dynamic> toJson() => {
        "option_type": optionType,
        "count": count,
        "of": of?.toJson(),
        "choice": choice?.toJson(),
      };
}

class Choice {
  final String desc;
  final int choose;
  final String type;
  final ChoiceFrom from;

  Choice({
    required this.desc,
    required this.choose,
    required this.type,
    required this.from,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        desc: json["desc"],
        choose: json["choose"],
        type: json["type"],
        from: ChoiceFrom.fromJson(json["from"]),
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "choose": choose,
        "type": type,
        "from": from.toJson(),
      };
}

class ChoiceFrom {
  final String optionSetType;
  final Proficiency equipmentCategory;

  ChoiceFrom({
    required this.optionSetType,
    required this.equipmentCategory,
  });

  factory ChoiceFrom.fromJson(Map<String, dynamic> json) => ChoiceFrom(
        optionSetType: json["option_set_type"],
        equipmentCategory: Proficiency.fromJson(json["equipment_category"]),
      );

  Map<String, dynamic> toJson() => {
        "option_set_type": optionSetType,
        "equipment_category": equipmentCategory.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
