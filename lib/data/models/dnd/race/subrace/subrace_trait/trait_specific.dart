import 'dart:convert';

import 'spell_options.dart';

class TraitSpecific {
  SpellOptions? spellOptions;

  TraitSpecific({this.spellOptions});

  @override
  String toString() => 'TraitSpecific(spellOptions: $spellOptions)';

  factory TraitSpecific.fromMap(Map<String, dynamic> data) => TraitSpecific(
        spellOptions: data['spell_options'] == null
            ? null
            : SpellOptions.fromMap(
                data['spell_options'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'spell_options': spellOptions?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TraitSpecific].
  factory TraitSpecific.fromJson(String data) {
    return TraitSpecific.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TraitSpecific] to a JSON string.
  String toJson() => json.encode(toMap());

  TraitSpecific copyWith({
    SpellOptions? spellOptions,
  }) {
    return TraitSpecific(
      spellOptions: spellOptions ?? this.spellOptions,
    );
  }
}
