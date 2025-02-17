import 'package:dnd_app/data/models/dnd/classes/class_proficency.dart';
import 'package:dnd_app/data/models/dnd/classes/multiclassing.dart';
import 'package:dnd_app/data/models/dnd/classes/saving_throws.dart';
import 'package:dnd_app/data/models/dnd/classes/spell_casting.dart';
import 'package:dnd_app/data/models/dnd/classes/starting_equipment.dart';
import 'package:dnd_app/data/models/dnd/classes/subclasses.dart';
import 'package:dnd_app/data/models/dnd/stats/proficency.dart';

import 'dart:convert';

class ClassDetails {
  String? index;
  String? name;
  int? hitDie;
  List<ProficiencyChoice>? proficiencyChoices;
  List<ClassProficiency>? proficiencies;
  List<SavingThrows>? savingThrows;
  List<StartingEquipment>? startingEquipment;
  List<StartingEquipmentOption>? startingEquipmentOptions;
  String? classLevels;
  MultiClassing? multiClassing;
  List<Subclasses>? subclasses;
  Spellcasting? spellcasting;
  String? spells;
  String? url;
  DateTime? updatedAt;

  ClassDetails({
    this.index,
    this.name,
    this.hitDie,
    this.proficiencyChoices,
    this.proficiencies,
    this.savingThrows,
    this.startingEquipment,
    this.startingEquipmentOptions,
    this.classLevels,
    this.multiClassing,
    this.subclasses,
    this.spellcasting,
    this.spells,
    this.url,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'ClassDetails(index: $index, name: $name, hitDie: $hitDie, proficiencyChoices: $proficiencyChoices, proficiencies: $proficiencies, savingThrows: $savingThrows, startingEquipment: $startingEquipment, startingEquipmentOptions: $startingEquipmentOptions, classLevels: $classLevels, multiClassing: $multiClassing, subclasses: $subclasses, spellcasting: $spellcasting, spells: $spells, url: $url, updatedAt: $updatedAt)';
  }

  factory ClassDetails.fromMap(Map<String, dynamic> data) => ClassDetails(
        index: data['index'] as String?,
        name: data['name'] as String?,
        hitDie: data['hit_die'] as int?,
        proficiencyChoices: (data['proficiency_choices'] as List<dynamic>?)
            ?.map((e) => ProficiencyChoice.fromJson(e as Map<String, dynamic>))
            .toList(),
        proficiencies: (data['proficiencies'] as List<dynamic>?)
            ?.whereType<Map<String, dynamic>>()
            .map((e) => ClassProficiency.fromJson(e))
            .toList(),
        savingThrows: (data['saving_throws'] as List<dynamic>?)
            ?.map((e) => SavingThrows.fromJson(e as Map<String, dynamic>))
            .toList(),
        startingEquipment: (data['starting_equipment'] as List<dynamic>?)
            ?.map((e) => StartingEquipment.fromJson(e as Map<String, dynamic>))
            .toList(),
        startingEquipmentOptions:
            (data['starting_equipment_options'] as List<dynamic>?)
                ?.map((e) =>
                    StartingEquipmentOption.fromJson(e as Map<String, dynamic>))
                .toList(),
        classLevels: data['class_levels'] as String?,
        multiClassing: data['multi_classing'] == null
            ? null
            : MultiClassing.fromJson(
                data['multi_classing'] as Map<String, dynamic>),
        subclasses: (data['subclasses'] as List<dynamic>?)
            ?.map((e) => Subclasses.fromJson(e as Map<String, dynamic>))
            .toList(),
        spellcasting: data['spellcasting'] == null
            ? null
            : Spellcasting.fromJson(
                data['spellcasting'] as Map<String, dynamic>),
        spells: data['spells'] as String?,
        url: data['url'] as String?,
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
      );

  Map<String, dynamic> toMap() => {
        'index': index,
        'name': name,
        'hit_die': hitDie,
        'proficiency_choices':
            proficiencyChoices?.map((e) => e.toJson()).toList(),
        'proficiencies': proficiencies?.map((e) => e.toJson()).toList(),
        'saving_throws': savingThrows?.map((e) => e.toJson()).toList(),
        'starting_equipment':
            startingEquipment?.map((e) => e.toJson()).toList(),
        'starting_equipment_options':
            startingEquipmentOptions?.map((e) => e.toJson()).toList(),
        'class_levels': classLevels,
        'multi_classing': multiClassing?.toJson(),
        'subclasses': subclasses?.map((e) => e.toJson()).toList(),
        'spellcasting': spellcasting?.toJson(),
        'spells': spells,
        'url': url,
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ClassDetails].
  factory ClassDetails.fromJson(String data) {
    return ClassDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ClassDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  ClassDetails copyWith({
    String? index,
    String? name,
    int? hitDie,
    List<ProficiencyChoice>? proficiencyChoices,
    List<ClassProficiency>? proficiencies,
    List<SavingThrows>? savingThrows,
    List<StartingEquipment>? startingEquipment,
    List<StartingEquipmentOption>? startingEquipmentOptions,
    String? classLevels,
    MultiClassing? multiClassing,
    List<Subclasses>? subclasses,
    Spellcasting? spellcasting,
    String? spells,
    String? url,
    DateTime? updatedAt,
  }) {
    return ClassDetails(
      index: index ?? this.index,
      name: name ?? this.name,
      hitDie: hitDie ?? this.hitDie,
      proficiencyChoices: proficiencyChoices ?? this.proficiencyChoices,
      proficiencies: proficiencies ?? this.proficiencies,
      savingThrows: savingThrows ?? this.savingThrows,
      startingEquipment: startingEquipment ?? this.startingEquipment,
      startingEquipmentOptions:
          startingEquipmentOptions ?? this.startingEquipmentOptions,
      classLevels: classLevels ?? this.classLevels,
      multiClassing: multiClassing ?? this.multiClassing,
      subclasses: subclasses ?? this.subclasses,
      spellcasting: spellcasting ?? this.spellcasting,
      spells: spells ?? this.spells,
      url: url ?? this.url,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class ProficiencyChoice {
  final String desc;
  final int choose;
  final String type;
  final ProficiencyChoiceFrom? from;

  ProficiencyChoice({
    required this.desc,
    required this.choose,
    required this.type,
    this.from,
  });

  factory ProficiencyChoice.fromJson(Map<String, dynamic> json) =>
      ProficiencyChoice(
        desc: json["desc"] ?? '',
        choose: json["choose"] ?? 1,
        type: json["type"] ?? '',
        from: json["from"] != null
            ? ProficiencyChoiceFrom.fromJson(json["from"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "choose": choose,
        "type": type,
        if (from != null) "from": from!.toJson(),
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
        optionSetType: json["option_set_type"] ?? '',
        options: (json["options"] as List<dynamic>? ?? [])
            .map((e) => PurpleOption.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "option_set_type": optionSetType,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };
}

class PurpleOption {
  final String optionType;
  final Proficiency? item;

  PurpleOption({
    required this.optionType,
    required this.item,
  });

  factory PurpleOption.fromJson(Map<String, dynamic> json) => PurpleOption(
        optionType: json["option_type"]?.toString() ?? '',
        item: json["item"] != null ? Proficiency.fromJson(json["item"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "option_type": optionType,
        "item": item?.toJson(),
      };
}

class StartingEquipmentOption {
  final String desc;
  final int choose;
  final String type;
  final StartingEquipmentOptionFrom? from;

  StartingEquipmentOption({
    required this.desc,
    required this.choose,
    required this.type,
    required this.from,
  });

  factory StartingEquipmentOption.fromJson(Map<String, dynamic> json) =>
      StartingEquipmentOption(
        desc: json["desc"] ?? '',
        choose: json["choose"] ?? 1,
        type: json["type"] ?? '',
        from: json["from"] != null
            ? StartingEquipmentOptionFrom.fromJson(json["from"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "choose": choose,
        "type": type,
        "from": from?.toJson(),
      };
}

class StartingEquipmentOptionFrom {
  final String optionSetType;
  final List<FluffyOption>? options;
  final Proficiency? equipmentCategory;

  StartingEquipmentOptionFrom({
    required this.optionSetType,
    this.options,
    this.equipmentCategory,
  });

  factory StartingEquipmentOptionFrom.fromJson(Map<String, dynamic> json) =>
      StartingEquipmentOptionFrom(
        optionSetType: json["option_set_type"] ?? '',
        options: json["options"] == null
            ? []
            : List<FluffyOption>.from(
                json["options"]!.map((x) => FluffyOption.fromJson(x))),
        equipmentCategory: json["equipment_category"] == null
            ? null
            : Proficiency.fromJson(json["equipment_category"]),
      );

  Map<String, dynamic> toJson() => {
        "option_set_type": optionSetType,
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
        "equipment_category": equipmentCategory?.toJson(),
      };
}

class FluffyOption {
  final String optionType;
  final List<Item>? items;
  final Choice? choice;
  final int? count;
  final Proficiency? of;

  FluffyOption({
    required this.optionType,
    this.items,
    this.choice,
    this.count,
    this.of,
  });

  factory FluffyOption.fromJson(Map<String, dynamic> json) => FluffyOption(
        optionType: json["option_type"] ?? '',
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        choice: json["choice"] == null ? null : Choice.fromJson(json["choice"]),
        count: json["count"] ?? 1,
        of: json["of"] == null ? null : Proficiency.fromJson(json["of"]),
      );

  Map<String, dynamic> toJson() => {
        "option_type": optionType,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "choice": choice?.toJson(),
        "count": count,
        "of": of?.toJson(),
      };
}

class Choice {
  final String desc;
  final int choose;
  final String type;
  final ChoiceFrom? from;

  Choice({
    required this.desc,
    required this.choose,
    required this.type,
    required this.from,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        desc: json["desc"] ?? '',
        choose: json["choose"] ?? 1,
        type: json["type"] ?? '',
        from: json["from"] != null ? ChoiceFrom.fromJson(json["from"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "choose": choose,
        "type": type,
        "from": from?.toJson(),
      };
}

class ChoiceFrom {
  final String optionSetType;
  final Proficiency? equipmentCategory;

  ChoiceFrom({
    required this.optionSetType,
    required this.equipmentCategory,
  });

  factory ChoiceFrom.fromJson(Map<String, dynamic> json) => ChoiceFrom(
        optionSetType: json["option_set_type"] ?? '',
        equipmentCategory: json["equipment_category"] != null
            ? Proficiency.fromJson(json["equipment_category"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "option_set_type": optionSetType,
        "equipment_category": equipmentCategory?.toJson(),
      };
}

class Item {
  final String optionType;
  final int count;
  final Proficiency? of;

  Item({
    required this.optionType,
    required this.count,
    required this.of,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        optionType: json["option_type"] ?? '',
        count: json["count"] ?? 1,
        of: json["of"] != null ? Proficiency.fromJson(json["of"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "option_type": optionType,
        "count": count,
        "of": of?.toJson(),
      };
}
