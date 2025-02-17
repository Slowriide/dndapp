import 'package:dnd_app/data/models/dnd/spells/school.dart';

class SpellDamage {
  final School? damageType;
  final Map<String, String>? damageAtSlotLevel;

  SpellDamage({
    required this.damageType,
    required this.damageAtSlotLevel,
  });

  factory SpellDamage.fromJson(Map<String, dynamic> json) => SpellDamage(
        damageType: json["damage_type"] != null
            ? School.fromJson(json["damage_type"])
            : null,
        damageAtSlotLevel: json["damage_at_slot_level"] != null
            ? Map<String, String>.from(json["damage_at_slot_level"])
            : null,
      );

  Map<String, dynamic>? toJson() => {
        "damage_type": damageType?.toJson(),
        "damage_at_slot_level": damageAtSlotLevel != null
            ? Map<String, String>.from(damageAtSlotLevel!)
            : null,
      };
}
