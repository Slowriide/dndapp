import 'dart:convert';

import 'from.dart';

class StartingEquipmentOption {
  String? desc;
  int? choose;
  String? type;
  From? from;

  StartingEquipmentOption({this.desc, this.choose, this.type, this.from});

  @override
  String toString() {
    return 'StartingEquipmentOption(desc: $desc, choose: $choose, type: $type, from: $from)';
  }

  factory StartingEquipmentOption.fromMap(Map<String, dynamic> data) {
    return StartingEquipmentOption(
      desc: data['desc'] as String?,
      choose: data['choose'] as int?,
      type: data['type'] as String?,
      from: data['from'] == null
          ? null
          : From.fromMap(data['from'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'desc': desc,
        'choose': choose,
        'type': type,
        'from': from?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StartingEquipmentOption].
  factory StartingEquipmentOption.fromJson(String data) {
    return StartingEquipmentOption.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [StartingEquipmentOption] to a JSON string.
  String toJson() => json.encode(toMap());

  StartingEquipmentOption copyWith({
    String? desc,
    int? choose,
    String? type,
    From? from,
  }) {
    return StartingEquipmentOption(
      desc: desc ?? this.desc,
      choose: choose ?? this.choose,
      type: type ?? this.type,
      from: from ?? this.from,
    );
  }
}
