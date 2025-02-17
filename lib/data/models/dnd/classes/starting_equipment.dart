import 'package:dnd_app/data/models/dnd/classes/equipment.dart';

class StartingEquipment {
  final ClassEquipment? equipment;
  final int quantity;

  StartingEquipment({
    required this.equipment,
    required this.quantity,
  });

  factory StartingEquipment.fromJson(Map<String, dynamic> json) =>
      StartingEquipment(
        equipment: (json["equipment"] != null &&
                json["equipment"] is Map<String, dynamic>)
            ? ClassEquipment.fromJson(json["equipment"])
            : null,
        quantity: json["quantity"] ?? 1,
      );

  Map<String, dynamic> toJson() => {
        "equipment": equipment?.toJson(),
        "quantity": quantity,
      };
}
