import 'dart:convert';

import 'multi_classing.dart';
import 'proficiency.dart';
import 'proficiency_choice.dart';
import 'saving_throw.dart';
import 'spellcasting.dart';
import 'starting_equipment.dart';
import 'starting_equipment_option.dart';
import 'subclass.dart';

class ClassDetails {
  String? index;
  String? name;
  int? hitDie;
  List<ProficiencyChoice>? proficiencyChoices;
  List<Proficiency>? proficiencies;
  List<SavingThrow>? savingThrows;
  List<StartingEquipment>? startingEquipment;
  List<StartingEquipmentOption>? startingEquipmentOptions;
  String? classLevels;
  MultiClassing? multiClassing;
  List<Subclass>? subclasses;
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
            ?.map((e) => ProficiencyChoice.fromMap(e as Map<String, dynamic>))
            .toList(),
        proficiencies: (data['proficiencies'] as List<dynamic>?)
            ?.map((e) => Proficiency.fromMap(e as Map<String, dynamic>))
            .toList(),
        savingThrows: (data['saving_throws'] as List<dynamic>?)
            ?.map((e) => SavingThrow.fromMap(e as Map<String, dynamic>))
            .toList(),
        startingEquipment: (data['starting_equipment'] as List<dynamic>?)
            ?.map((e) => StartingEquipment.fromMap(e as Map<String, dynamic>))
            .toList(),
        startingEquipmentOptions:
            (data['starting_equipment_options'] as List<dynamic>?)
                ?.map((e) =>
                    StartingEquipmentOption.fromMap(e as Map<String, dynamic>))
                .toList(),
        classLevels: data['class_levels'] as String?,
        multiClassing: data['multi_classing'] == null
            ? null
            : MultiClassing.fromMap(
                data['multi_classing'] as Map<String, dynamic>),
        subclasses: (data['subclasses'] as List<dynamic>?)
            ?.map((e) => Subclass.fromMap(e as Map<String, dynamic>))
            .toList(),
        spellcasting: data['spellcasting'] == null
            ? null
            : Spellcasting.fromMap(
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
            proficiencyChoices?.map((e) => e.toMap()).toList(),
        'proficiencies': proficiencies?.map((e) => e.toMap()).toList(),
        'saving_throws': savingThrows?.map((e) => e.toMap()).toList(),
        'starting_equipment': startingEquipment?.map((e) => e.toMap()).toList(),
        'starting_equipment_options':
            startingEquipmentOptions?.map((e) => e.toMap()).toList(),
        'class_levels': classLevels,
        'multi_classing': multiClassing?.toMap(),
        'subclasses': subclasses?.map((e) => e.toMap()).toList(),
        'spellcasting': spellcasting?.toMap(),
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
    List<Proficiency>? proficiencies,
    List<SavingThrow>? savingThrows,
    List<StartingEquipment>? startingEquipment,
    List<StartingEquipmentOption>? startingEquipmentOptions,
    String? classLevels,
    MultiClassing? multiClassing,
    List<Subclass>? subclasses,
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
