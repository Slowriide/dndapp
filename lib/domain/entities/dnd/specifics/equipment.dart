import 'package:dnd_app/data/models/dnd/equipment/equipment_category.dart';
import 'package:dnd_app/data/models/dnd/equipment/equipment_cost.dart';
import 'package:dnd_app/domain/entities/dnd/favoriteable.dart';
import 'package:isar/isar.dart';

part 'equipment.g.dart';

@collection
class Equipment implements Favoritable {
  Id? isarId;

  @ignore
  final List<dynamic>? desc;
  @ignore
  final List<dynamic>? special;
  final String index;
  final String name;
  @ignore
  final EquipmentCategory? equipmentCategory;
  @ignore
  final EquipmentCategory? gearCategory;
  @ignore
  final Cost? cost;
  @ignore
  final int? weight;
  final String url;
  final DateTime? updatedAt;
  @ignore
  final List<dynamic>? contents;
  @ignore
  final List<dynamic>? properties;

  Equipment({
    this.desc,
    this.special,
    required this.index,
    required this.name,
    this.equipmentCategory,
    this.gearCategory,
    this.cost,
    this.weight,
    required this.url,
    required this.updatedAt,
    this.contents,
    this.properties,
  });

  @override
  String get displayId => index;

  @override
  String get displayName => name;
  @override
  String get imageUrl =>
      'https://cdn3.futbin.com/content/fifa25/img/players/p134475262.png?fm=png&ixlib=java-2.1.0&verzion=1&w=252&s=e1e6294f3cbf185c802b60c63f8f00fa';
  @override
  String get navigatePath => '/home/0/api/2014/equipment/$index';
}
