import 'package:dnd_app/data/models/dnd/classes/class_proficency.dart';
import 'package:dnd_app/data/models/dnd/classes/multiclassing.dart';
import 'package:dnd_app/data/models/dnd/classes/my_proficency_choice.dart';
import 'package:dnd_app/data/models/dnd/classes/saving_throws.dart';
import 'package:dnd_app/data/models/dnd/classes/spell_casting.dart';
import 'package:dnd_app/data/models/dnd/classes/starting_equipment.dart';
import 'package:dnd_app/data/models/dnd/classes/starting_equipment_options.dart';
import 'package:dnd_app/data/models/dnd/classes/subclasses.dart';
import 'package:dnd_app/domain/entities/dnd/favoriteable.dart';
import 'package:isar/isar.dart';

part 'dnd_class.g.dart';

@collection
class DndClass implements Favoritable {
  Id? isarId;
  final String? index;
  final String? name;
  @ignore
  final int? hitDie;
  @ignore
  final List<MyProficiencyChoice>? proficiencyChoices;
  @ignore
  final List<ClassProficiency>? proficiencies;
  @ignore
  final List<SavingThrows>? savingThrows;
  @ignore
  final List<StartingEquipment>? startingEquipment;
  @ignore
  final List<MyStartingEquipmentOption>? startingEquipmentOptions;
  @ignore
  final String? classLevels;
  @ignore
  final MultiClassing? multiClassing;
  @ignore
  final Spellcasting? spellcasting;
  @ignore
  final String? spells;
  @ignore
  final List<Subclasses>? subclasses;
  final String? url;
  final DateTime? updatedAt;

  DndClass({
    this.isarId,
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

  @override
  String get displayId => index ?? '';

  @override
  String get displayName => name ?? '';
  @override
  String get imageUrl =>
      'https://cdn3.futbin.com/content/fifa25/img/players/p134475262.png?fm=png&ixlib=java-2.1.0&verzion=1&w=252&s=e1e6294f3cbf185c802b60c63f8f00fa';
  @override
  String get navigatePath => '/home/0/api/2014/classes/$index';
}

String getFilteredProficiencyNames(List<ClassProficiency>? proficiencyItems) {
  List<String> filteredNames = proficiencyItems!
      .where((item) =>
          item.name.toLowerCase().contains('weapon') ||
          item.name.toLowerCase().contains('shield'))
      .map((item) => item.name)
      .toList();

  return filteredNames.join(', ');
}

String getFilteredProficencyArmors(List<ClassProficiency>? proficencyItems) {
  List<String> filteredNames = proficencyItems!
      .where((item) => item.name.toLowerCase().contains('armor'))
      .map((item) => item.name)
      .toList();

  return filteredNames.isEmpty ? 'None' : filteredNames.join(', ');
}
