import 'package:dnd_app/data/models/dnd/equipment/equipment_category.dart';
import 'package:dnd_app/data/models/dnd/equipment/equipment_rarity.dart';

class MagicItemDetails {
  final String index;
  final String name;
  final EquipmentCategory equipmentCategory;
  final Rarity rarity;
  final List<EquipmentCategory> variants;
  final bool variant;
  final List<String> desc;
  final String url;
  final DateTime updatedAt;

  MagicItemDetails({
    required this.index,
    required this.name,
    required this.equipmentCategory,
    required this.rarity,
    required this.variants,
    required this.variant,
    required this.desc,
    required this.url,
    required this.updatedAt,
  });

  factory MagicItemDetails.fromJson(Map<String, dynamic> json) =>
      MagicItemDetails(
        index: json["index"] ?? '',
        name: json["name"] ?? '',
        equipmentCategory:
            EquipmentCategory.fromJson(json["equipment_category"]),
        rarity: Rarity.fromJson(json["rarity"]),
        variants: List<EquipmentCategory>.from(
            json["variants"].map((x) => EquipmentCategory.fromJson(x))),
        variant: json["variant"],
        desc: List<String>.from(json["desc"].map((x) => x)),
        url: json["url"] ?? '',
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "name": name,
        "equipment_category": equipmentCategory.toJson(),
        "rarity": rarity.toJson(),
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
        "variant": variant,
        "desc": List<dynamic>.from(desc.map((x) => x)),
        "url": url,
        "updated_at": updatedAt.toIso8601String(),
      };
}
