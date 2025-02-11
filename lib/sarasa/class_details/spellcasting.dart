import 'dart:convert';

import 'info.dart';
import 'spellcasting_ability.dart';

class Spellcasting {
  int? level;
  SpellcastingAbility? spellcastingAbility;
  List<Info>? info;

  Spellcasting({this.level, this.spellcastingAbility, this.info});

  @override
  String toString() {
    return 'Spellcasting(level: $level, spellcastingAbility: $spellcastingAbility, info: $info)';
  }

  factory Spellcasting.fromMap(Map<String, dynamic> data) => Spellcasting(
        level: data['level'] as int?,
        spellcastingAbility: data['spellcasting_ability'] == null
            ? null
            : SpellcastingAbility.fromMap(
                data['spellcasting_ability'] as Map<String, dynamic>),
        info: (data['info'] as List<dynamic>?)
            ?.map((e) => Info.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'level': level,
        'spellcasting_ability': spellcastingAbility?.toMap(),
        'info': info?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Spellcasting].
  factory Spellcasting.fromJson(String data) {
    return Spellcasting.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Spellcasting] to a JSON string.
  String toJson() => json.encode(toMap());

  Spellcasting copyWith({
    int? level,
    SpellcastingAbility? spellcastingAbility,
    List<Info>? info,
  }) {
    return Spellcasting(
      level: level ?? this.level,
      spellcastingAbility: spellcastingAbility ?? this.spellcastingAbility,
      info: info ?? this.info,
    );
  }
}
