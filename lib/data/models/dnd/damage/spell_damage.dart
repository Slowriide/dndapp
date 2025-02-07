import 'package:dnd_app/data/models/dnd/spells/school.dart';

class SpellDamage {
  final School damageType;
  final Map<String, String> damageAtSlotLevel;

  SpellDamage({
    required this.damageType,
    required this.damageAtSlotLevel,
  });

  factory SpellDamage.fromJson(Map<String, dynamic> json) => SpellDamage(
        damageType: School.fromJson(json["damage_type"]),
        damageAtSlotLevel: Map.from(json["damage_at_slot_level"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "damage_type": damageType.toJson(),
        "damage_at_slot_level": Map.from(damageAtSlotLevel)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
