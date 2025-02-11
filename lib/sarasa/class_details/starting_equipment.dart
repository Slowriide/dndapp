import 'dart:convert';

import 'equipment.dart';

class StartingEquipment {
  Equipment? equipment;
  int? quantity;

  StartingEquipment({this.equipment, this.quantity});

  @override
  String toString() {
    return 'StartingEquipment(equipment: $equipment, quantity: $quantity)';
  }

  factory StartingEquipment.fromMap(Map<String, dynamic> data) {
    return StartingEquipment(
      equipment: data['equipment'] == null
          ? null
          : Equipment.fromMap(data['equipment'] as Map<String, dynamic>),
      quantity: data['quantity'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'equipment': equipment?.toMap(),
        'quantity': quantity,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StartingEquipment].
  factory StartingEquipment.fromJson(String data) {
    return StartingEquipment.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [StartingEquipment] to a JSON string.
  String toJson() => json.encode(toMap());

  StartingEquipment copyWith({
    Equipment? equipment,
    int? quantity,
  }) {
    return StartingEquipment(
      equipment: equipment ?? this.equipment,
      quantity: quantity ?? this.quantity,
    );
  }
}
