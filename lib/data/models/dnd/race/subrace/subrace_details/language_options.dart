import 'dart:convert';

import 'from.dart';

class LanguageOptions {
  int? choose;
  From? from;
  String? type;

  LanguageOptions({this.choose, this.from, this.type});

  @override
  String toString() {
    return 'LanguageOptions(choose: $choose, from: $from, type: $type)';
  }

  factory LanguageOptions.fromMap(Map<String, dynamic> data) {
    return LanguageOptions(
      choose: data['choose'] as int?,
      from: data['from'] == null
          ? null
          : From.fromMap(data['from'] as Map<String, dynamic>),
      type: data['type'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'choose': choose,
        'from': from?.toMap(),
        'type': type,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LanguageOptions].
  factory LanguageOptions.fromJson(String data) {
    return LanguageOptions.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LanguageOptions] to a JSON string.
  String toJson() => json.encode(toMap());

  LanguageOptions copyWith({
    int? choose,
    From? from,
    String? type,
  }) {
    return LanguageOptions(
      choose: choose ?? this.choose,
      from: from ?? this.from,
      type: type ?? this.type,
    );
  }
}
