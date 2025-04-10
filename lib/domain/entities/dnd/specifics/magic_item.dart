import 'package:dnd_app/data/models/dnd/equipment/equipment_category.dart';
import 'package:dnd_app/data/models/dnd/equipment/equipment_rarity.dart';
import 'package:dnd_app/domain/entities/dnd/favoriteable.dart';
import 'package:isar/isar.dart';

part 'magic_item.g.dart';

@collection
class MagicItem implements Favoritable {
  Id? IsarId;

  final String index;
  final String name;
  @ignore
  final EquipmentCategory? equipmentCategory;
  @ignore
  final Rarity? rarity;
  @ignore
  final List<EquipmentCategory>? variants;
  final bool variant;
  final List<String> desc;
  final String url;
  final DateTime updatedAt;

  @override
  String get displayId => index;

  @override
  String get displayName => name;

  @override
  String get imageUrl =>
      'https://cdn3.futbin.com/content/fifa25/img/players/p134475262.png?fm=png&ixlib=java-2.1.0&verzion=1&w=252&s=e1e6294f3cbf185c802b60c63f8f00fa';

  @override
  String get navigatePath => '/home/0/api/2014/magic-items/$index';

  MagicItem({
    required this.index,
    required this.name,
    this.equipmentCategory,
    this.rarity,
    this.variants,
    required this.variant,
    required this.desc,
    required this.url,
    required this.updatedAt,
  });

  factory MagicItem.fromJson(Map<String, dynamic> json) => MagicItem(
        index: json["index"],
        name: json["name"],
        equipmentCategory:
            EquipmentCategory.fromJson(json["equipment_category"]),
        rarity: Rarity.fromJson(json["rarity"]),
        variants: List<EquipmentCategory>.from(
            json["variants"].map((x) => EquipmentCategory.fromJson(x))),
        variant: json["variant"],
        desc: List<String>.from(json["desc"].map((x) => x)),
        url: json["url"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "name": name,
        "equipment_category": equipmentCategory?.toJson(),
        "rarity": rarity?.toJson(),
        "variants": List<dynamic>.from(variants!.map((x) => x.toJson())),
        "variant": variant,
        "desc": List<dynamic>.from(desc.map((x) => x)),
        "url": url,
        "updated_at": updatedAt.toIso8601String(),
      };
}
