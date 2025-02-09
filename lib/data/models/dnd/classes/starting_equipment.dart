import 'package:dnd_app/data/models/dnd/classes/equipment.dart';

class StartingEquipment {
  final Equipment equipment;
  final int quantity;

  StartingEquipment({
    required this.equipment,
    required this.quantity,
  });

  factory StartingEquipment.fromJson(Map<String, dynamic> json) =>
      StartingEquipment(
        equipment: Equipment.fromJson(json["equipment"]),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "equipment": equipment.toJson(),
        "quantity": quantity,
      };
}
