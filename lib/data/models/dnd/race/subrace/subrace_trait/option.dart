import 'dart:convert';

import 'item.dart';

class Option {
  String? optionType;
  Item? item;

  Option({this.optionType, this.item});

  @override
  String toString() => 'Option(optionType: $optionType, item: $item)';

  factory Option.fromMap(Map<String, dynamic> data) => Option(
        optionType: data['option_type'] as String?,
        item: data['item'] == null
            ? null
            : Item.fromMap(data['item'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'option_type': optionType,
        'item': item?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Option].
  factory Option.fromJson(String data) {
    return Option.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Option] to a JSON string.
  String toJson() => json.encode(toMap());

  Option copyWith({
    String? optionType,
    Item? item,
  }) {
    return Option(
      optionType: optionType ?? this.optionType,
      item: item ?? this.item,
    );
  }
}
