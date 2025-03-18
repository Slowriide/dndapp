import 'dart:convert';

import 'option.dart';

class From {
  String? optionSetType;
  List<Option>? options;

  From({this.optionSetType, this.options});

  @override
  String toString() {
    return 'From(optionSetType: $optionSetType, options: $options)';
  }

  factory From.fromMap(Map<String, dynamic> data) => From(
        optionSetType: data['option_set_type'] as String?,
        options: (data['options'] as List<dynamic>?)
            ?.map((e) => Option.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'option_set_type': optionSetType,
        'options': options?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [From].
  factory From.fromJson(String data) {
    return From.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [From] to a JSON string.
  String toJson() => json.encode(toMap());

  From copyWith({
    String? optionSetType,
    List<Option>? options,
  }) {
    return From(
      optionSetType: optionSetType ?? this.optionSetType,
      options: options ?? this.options,
    );
  }
}
