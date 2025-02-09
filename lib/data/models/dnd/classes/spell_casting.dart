import 'package:dnd_app/data/models/dnd/actions/spell_casting_ability.dart';

class Spellcasting {
  final int level;
  final SpellCastingAbility spellcastingAbility;
  final List<Info> info;

  Spellcasting({
    required this.level,
    required this.spellcastingAbility,
    required this.info,
  });

  factory Spellcasting.fromJson(Map<String, dynamic> json) => Spellcasting(
        level: json["level"],
        spellcastingAbility:
            SpellCastingAbility.fromJson(json["spellcasting_ability"]),
        info: List<Info>.from(json["info"].map((x) => Info.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "level": level,
        "spellcasting_ability": spellcastingAbility.toJson(),
        "info": List<dynamic>.from(info.map((x) => x.toJson())),
      };
}

class Info {
  final String name;
  final List<String> desc;

  Info({
    required this.name,
    required this.desc,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        name: json["name"],
        desc: List<String>.from(json["desc"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "desc": List<dynamic>.from(desc.map((x) => x)),
      };
}
