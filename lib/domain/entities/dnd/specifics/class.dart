import 'package:dnd_app/data/models/dnd/class_details.dart';
import 'package:dnd_app/data/models/dnd/classes/multiclassing.dart';
import 'package:dnd_app/data/models/dnd/classes/my_proficency_choice.dart';
import 'package:dnd_app/data/models/dnd/classes/spell_casting.dart';
import 'package:dnd_app/data/models/dnd/classes/starting_equipment.dart';
import 'package:dnd_app/data/models/dnd/classes/starting_equipment_options.dart';
import 'package:dnd_app/data/models/dnd/classes/subclasses.dart';
import 'package:dnd_app/data/models/dnd/stats/proficency.dart';

class Class {
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
  final Spellcasting spellcasting;
  final String? spells;
  final List<Subclasses>? subclasses;
  final String url;
  final DateTime updatedAt;

  Class({
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
    required this.spellcasting,
    required this.spells,
    required this.subclasses,
    required this.url,
    required this.updatedAt,
  });
}
