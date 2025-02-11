import 'package:dnd_app/data/models/dnd/classes/multiclassing.dart';
import 'package:dnd_app/data/models/dnd/classes/my_proficency_choice.dart';
import 'package:dnd_app/data/models/dnd/classes/saving_throws.dart';
import 'package:dnd_app/data/models/dnd/classes/spell_casting.dart';
import 'package:dnd_app/data/models/dnd/classes/starting_equipment.dart';
import 'package:dnd_app/data/models/dnd/classes/starting_equipment_options.dart';
import 'package:dnd_app/data/models/dnd/classes/subclasses.dart';
import 'package:dnd_app/data/models/dnd/stats/proficency.dart';

class Class {
  final String? index;
  final String? name;
  final int? hitDie;
  final List<MyProficiencyChoice>? proficiencyChoices;
  final List<Proficiency>? proficiencies;
  final List<SavingThrows>? savingThrows;
  final List<StartingEquipment>? startingEquipment;
  final List<MyStartingEquipmentOption>? startingEquipmentOptions;
  final String? classLevels;
  final MultiClassing? multiClassing;
  final Spellcasting? spellcasting;
  final String? spells;
  final List<Subclasses>? subclasses;
  final String? url;
  final DateTime? updatedAt;

  Class({
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
    this.spellcasting,
    this.spells,
    this.subclasses,
    this.url,
    this.updatedAt,
  });
}
