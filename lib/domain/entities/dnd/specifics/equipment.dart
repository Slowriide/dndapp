import 'package:dnd_app/data/models/dnd/equipment/equipment_category.dart';
import 'package:dnd_app/data/models/dnd/equipment/equipment_cost.dart';

class Equipment {
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

  Equipment({
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
}
