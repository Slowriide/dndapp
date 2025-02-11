import 'dart:convert';

import 'from.dart';

class ProficiencyChoice {
  String? desc;
  int? choose;
  String? type;
  From? from;

  ProficiencyChoice({this.desc, this.choose, this.type, this.from});

  @override
  String toString() {
    return 'ProficiencyChoice(desc: $desc, choose: $choose, type: $type, from: $from)';
  }

  factory ProficiencyChoice.fromMap(Map<String, dynamic> data) {
    return ProficiencyChoice(
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
  /// Parses the string and returns the resulting Json object as [ProficiencyChoice].
  factory ProficiencyChoice.fromJson(String data) {
    return ProficiencyChoice.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProficiencyChoice] to a JSON string.
  String toJson() => json.encode(toMap());

  ProficiencyChoice copyWith({
    String? desc,
    int? choose,
    String? type,
    From? from,
  }) {
    return ProficiencyChoice(
      desc: desc ?? this.desc,
      choose: choose ?? this.choose,
      type: type ?? this.type,
      from: from ?? this.from,
    );
  }
}
