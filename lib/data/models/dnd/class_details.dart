import 'package:dnd_app/data/models/dnd/classes/multiclassing.dart';
import 'package:dnd_app/data/models/dnd/classes/my_proficency_choice.dart';
import 'package:dnd_app/data/models/dnd/classes/spell_casting.dart';
import 'package:dnd_app/data/models/dnd/classes/starting_equipment.dart';
import 'package:dnd_app/data/models/dnd/classes/starting_equipment_options.dart';
import 'package:dnd_app/data/models/dnd/classes/subclasses.dart';
import 'package:dnd_app/data/models/dnd/stats/proficency.dart';

class ClassDetails {
  final String index;
  final String name;
  final int hitDie;
  final List<ProficiencyChoice>? proficiencyChoices;
  final List<Proficiency>? proficiencies;
  final List<Proficiency> savingThrows;
  final List<StartingEquipment> startingEquipment;
  final List<StartingEquipmentOption>? startingEquipmentOptions;
  final String classLevels;
  final MultiClassing? multiClassing;
  final List<Subclasses> subclasses;
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
        hitDie: json["hit_die"] != null
            ? (json["hit_die"] is int
                ? json["hit_die"]
                : int.tryParse(json["hit_die"].toString()) ?? 1)
            : 1,
        proficiencyChoices: json["proficiency_choices"] != null
            ? List<ProficiencyChoice>.from(json["proficiency_choices"]
                .map((x) => ProficiencyChoice.fromJson(x)))
            : [],
        proficiencies: json["proficiencies"] != null
            ? List<Proficiency>.from(
                json["proficiencies"].map((x) => Proficiency.fromJson(x)))
            : [],
        savingThrows: List<Proficiency>.from(
            json["saving_throws"].map((x) => Proficiency.fromJson(x))),
        startingEquipment: List<StartingEquipment>.from(
            json["starting_equipment"]
                .map((x) => StartingEquipment.fromJson(x))),
        startingEquipmentOptions: json["starting_equipment_options"] != null
            ? List<StartingEquipmentOption>.from(
                json["starting_equipment_options"]
                    .map((x) => StartingEquipmentOption.fromJson(x)))
            : [],
        classLevels: json["class_levels"],
        multiClassing: json["multi_classing"] != null
            ? MultiClassing.fromJson(json["multi_classing"])
            : null,
        subclasses: List<Subclasses>.from(
            json["subclasses"].map((x) => Subclasses.fromJson(x))),
        spellcasting: Spellcasting.fromJson(json["spellcasting"]),
        spells: json["spells"],
        url: json["url"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "name": name,
        "hit_die": hitDie,
        "proficiency_choices": proficiencyChoices == null
            ? null
            : List<dynamic>.from(proficiencyChoices!.map((x) => x.toJson())),
        "proficiencies": proficiencies == null
            ? null
            : List<dynamic>.from(proficiencies!.map((x) => x.toJson())),
        "saving_throws":
            List<dynamic>.from(savingThrows.map((x) => x.toJson())),
        "starting_equipment":
            List<dynamic>.from(startingEquipment.map((x) => x.toJson())),
        "starting_equipment_options": startingEquipmentOptions == null
            ? null
            : List<dynamic>.from(
                startingEquipmentOptions!.map((x) => x.toJson())),
        "class_levels": classLevels,
        "multi_classing": multiClassing?.toJson(),
        "subclasses": List<dynamic>.from(subclasses.map((x) => x.toJson())),
        "spellcasting": spellcasting.toJson(),
        "spells": spells,
        "url": url,
        "updated_at": updatedAt.toIso8601String(),
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
  final String optionType;
  final Proficiency item;

  PurpleOption({
    required this.optionType,
    required this.item,
  });

  factory PurpleOption.fromJson(Map<String, dynamic> json) => PurpleOption(
        optionType: json["option_type"],
        item: Proficiency.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "option_type": optionType,
        "item": item.toJson(),
      };
}
