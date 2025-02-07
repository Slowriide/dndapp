import 'package:dnd_app/data/models/dnd/damage/spell_damage.dart';
import 'package:dnd_app/data/models/dnd/spells/school.dart';

class Spell {
  final String index;
  final String name;
  final List<String> desc;
  final List<String> higherLevel;
  final String range;
  final List<String> components;
  final String material;
  final bool ritual;
  final String duration;
  final bool concentration;
  final String castingTime;
  final int level;
  final String attackType;
  final SpellDamage damage;
  final School school;
  final List<School> classes;
  final List<School> subclasses;
  final String url;
  final DateTime updatedAt;

  Spell({
    required this.index,
    required this.name,
    required this.desc,
    required this.higherLevel,
    required this.range,
    required this.components,
    required this.material,
    required this.ritual,
    required this.duration,
    required this.concentration,
    required this.castingTime,
    required this.level,
    required this.attackType,
    required this.damage,
    required this.school,
    required this.classes,
    required this.subclasses,
    required this.url,
    required this.updatedAt,
  });
}
