// To parse this JSON data, do
//
//     final equipmentDetails = equipmentDetailsFromJson(jsonString);

import 'dart:convert';

import 'package:dnd_app/data/models/dnd/equipment/equipment_category.dart';
import 'package:dnd_app/data/models/dnd/equipment/equipment_cost.dart';

EquipmentDetails equipmentDetailsFromJson(String str) =>
    EquipmentDetails.fromJson(json.decode(str));

String equipmentDetailsToJson(EquipmentDetails data) =>
    json.encode(data.toJson());

class EquipmentDetails {
  final List<dynamic> desc;
  final List<dynamic> special;
  final String index;
  final String name;
  final EquipmentCategory equipmentCategory;
  final EquipmentCategory gearCategory;
  final Cost cost;
  final int weight;
  final String url;
  final DateTime updatedAt;
  final List<dynamic> contents;
  final List<dynamic> properties;

  EquipmentDetails({
    required this.desc,
    required this.special,
    required this.index,
    required this.name,
    required this.equipmentCategory,
    required this.gearCategory,
    required this.cost,
    required this.weight,
    required this.url,
    required this.updatedAt,
    required this.contents,
    required this.properties,
  });

  factory EquipmentDetails.fromJson(Map<String, dynamic> json) =>
      EquipmentDetails(
        desc: List<dynamic>.from(json["desc"].map((x) => x)),
        special: List<dynamic>.from(json["special"].map((x) => x)),
        index: json["index"],
        name: json["name"],
        equipmentCategory:
            EquipmentCategory.fromJson(json["equipment_category"]),
        gearCategory: EquipmentCategory.fromJson(json["gear_category"]),
        cost: Cost.fromJson(json["cost"]),
        weight: json["weight"],
        url: json["url"],
        updatedAt: DateTime.parse(json["updated_at"]),
        contents: List<dynamic>.from(json["contents"].map((x) => x)),
        properties: List<dynamic>.from(json["properties"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "desc": List<dynamic>.from(desc.map((x) => x)),
        "special": List<dynamic>.from(special.map((x) => x)),
        "index": index,
        "name": name,
        "equipment_category": equipmentCategory.toJson(),
        "gear_category": gearCategory.toJson(),
        "cost": cost.toJson(),
        "weight": weight,
        "url": url,
        "updated_at": updatedAt.toIso8601String(),
        "contents": List<dynamic>.from(contents.map((x) => x)),
        "properties": List<dynamic>.from(properties.map((x) => x)),
      };
}
