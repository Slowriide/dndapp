import 'package:dnd_app/data/models/dnd/actions/action_action.dart';
import 'package:dnd_app/data/models/dnd/actions/action_usage.dart';
import 'package:dnd_app/data/models/dnd/damage/damage.dart';
import 'package:dnd_app/data/models/dnd/damage/dc.dart';

class MonsterAction {
  String name;
  String? multiattackType;
  String desc;
  List<ActionAction> actions;
  int? attackBonus;
  List<Damage>? damage;
  Dc? dc;
  ActionUsage? usage;

  MonsterAction({
    required this.name,
    this.multiattackType,
    required this.desc,
    required this.actions,
    this.attackBonus,
    this.damage,
    this.dc,
    this.usage,
  });

  factory MonsterAction.fromJson(Map<String, dynamic> json) => MonsterAction(
        name: json["name"],
        multiattackType: json["multiattack_type"],
        desc: json["desc"],
        actions: List<ActionAction>.from(
            json["actions"].map((x) => ActionAction.fromJson(x))),
        attackBonus: json["attack_bonus"],
        damage: json["damage"] == null
            ? []
            : List<Damage>.from(json["damage"]!.map((x) => Damage.fromJson(x))),
        dc: json["dc"] == null ? null : Dc.fromJson(json["dc"]),
        usage:
            json["usage"] != null ? ActionUsage.fromJson(json["usage"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "multiattack_type": multiattackType,
        "desc": desc,
        "actions": List<dynamic>.from(actions.map((x) => x.toJson())),
        "attack_bonus": attackBonus,
        "damage": damage == null
            ? []
            : List<dynamic>.from(damage!.map((x) => x.toJson())),
        "dc": dc?.toJson(),
        "usage": usage?.toJson(),
      };
}
