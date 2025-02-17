import 'package:dnd_app/data/models/dnd/damage/spell_damage.dart';
import 'package:dnd_app/data/models/dnd/spells/school.dart';

class SpellsDetails {
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
  final int? level;
  final String attackType;
  final SpellDamage? damage;
  final School school;
  final List<School> classes;
  final List<School> subclasses;
  final String url;
  final DateTime updatedAt;

  SpellsDetails({
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

  factory SpellsDetails.fromJson(Map<String, dynamic> json) => SpellsDetails(
        index: json["index"] ?? '',
        name: json["name"] ?? '',
        desc: List<String>.from(json["desc"].map((x) => x)),
        higherLevel: List<String>.from(json["higher_level"].map((x) => x)),
        range: json["range"],
        components: List<String>.from(json["components"].map((x) => x)),
        material: json["material"] ?? '',
        ritual: json["ritual"] ?? '',
        duration: json["duration"] ?? '',
        concentration: json["concentration"] ?? '',
        castingTime: json["casting_time"] ?? '',
        level: json["level"] ?? 0,
        attackType: json["attack_type"] ?? '',
        damage: json["damage"] != null
            ? SpellDamage.fromJson(json["damage"])
            : null,
        school: School.fromJson(json["school"]),
        classes:
            List<School>.from(json["classes"].map((x) => School.fromJson(x))),
        subclasses: List<School>.from(
            json["subclasses"].map((x) => School.fromJson(x))),
        url: json["url"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "name": name,
        "desc": List<dynamic>.from(desc.map((x) => x)),
        "higher_level": List<dynamic>.from(higherLevel.map((x) => x)),
        "range": range,
        "components": List<dynamic>.from(components.map((x) => x)),
        "material": material,
        "ritual": ritual,
        "duration": duration,
        "concentration": concentration,
        "casting_time": castingTime,
        "level": level,
        "attack_type": attackType,
        "damage": damage?.toJson(),
        "school": school.toJson(),
        "classes": List<dynamic>.from(classes.map((x) => x.toJson())),
        "subclasses": List<dynamic>.from(subclasses.map((x) => x.toJson())),
        "url": url,
        "updated_at": updatedAt.toIso8601String(),
      };
}
