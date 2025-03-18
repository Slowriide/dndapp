import 'dart:convert';

import 'from.dart';

class SpellOptions {
  int? choose;
  From? from;
  String? type;

  SpellOptions({this.choose, this.from, this.type});

  @override
  String toString() {
    return 'SpellOptions(choose: $choose, from: $from, type: $type)';
  }

  factory SpellOptions.fromMap(Map<String, dynamic> data) => SpellOptions(
        choose: data['choose'] as int?,
        from: data['from'] == null
            ? null
            : From.fromMap(data['from'] as Map<String, dynamic>),
        type: data['type'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'choose': choose,
        'from': from?.toMap(),
        'type': type,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SpellOptions].
  factory SpellOptions.fromJson(String data) {
    return SpellOptions.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SpellOptions] to a JSON string.
  String toJson() => json.encode(toMap());

  SpellOptions copyWith({
    int? choose,
    From? from,
    String? type,
  }) {
    return SpellOptions(
      choose: choose ?? this.choose,
      from: from ?? this.from,
      type: type ?? this.type,
    );
  }
}
