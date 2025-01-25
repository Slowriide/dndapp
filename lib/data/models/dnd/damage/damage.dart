import 'package:dnd_app/data/models/dnd/damage/damage_type.dart';

class Damage {
  DamageType damageType;
  String damageDice;

  Damage({
    required this.damageType,
    required this.damageDice,
  });

  factory Damage.fromJson(Map<String, dynamic> json) => Damage(
        damageType: DamageType.fromJson(json["damage_type"]),
        damageDice: json["damage_dice"],
      );

  Map<String, dynamic> toJson() => {
        "damage_type": damageType.toJson(),
        "damage_dice": damageDice,
      };
}
