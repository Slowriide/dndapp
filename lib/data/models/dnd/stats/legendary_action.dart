import 'package:dnd_app/data/models/dnd/damage/damage.dart';
import 'package:dnd_app/data/models/dnd/damage/dc.dart';

class LegendaryAction {
  String name;
  String desc;
  Dc? dc;
  List<Damage>? damage;

  LegendaryAction({
    required this.name,
    required this.desc,
    this.dc,
    this.damage,
  });

  factory LegendaryAction.fromJson(Map<String, dynamic> json) =>
      LegendaryAction(
        name: json["name"],
        desc: json["desc"],
        dc: json["dc"] == null ? null : Dc.fromJson(json["dc"]),
        damage: json["damage"] == null
            ? []
            : List<Damage>.from(json["damage"]!.map((x) => Damage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "desc": desc,
        "dc": dc?.toJson(),
        "damage": damage == null
            ? []
            : List<dynamic>.from(damage!.map((x) => x.toJson())),
      };
}
