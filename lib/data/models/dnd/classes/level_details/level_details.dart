import 'dart:convert';

import 'levels_class.dart';
import 'class_specific.dart';
import 'features.dart';
import 'spellcasting.dart';

class LevelClassDetails {
  int? level;
  int? abilityScoreBonuses;
  int? profBonus;
  List<Features>? features;
  Spellcasting? spellcasting;
  ClassSpecific? classSpecific;
  String? index;
  LevelsClass? levelDetailsClass;
  String? url;
  DateTime? updatedAt;

  LevelClassDetails({
    this.level,
    this.abilityScoreBonuses,
    this.profBonus,
    this.features,
    this.spellcasting,
    this.classSpecific,
    this.index,
    this.levelDetailsClass,
    this.url,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'LevelDetails(level: $level, abilityScoreBonuses: $abilityScoreBonuses, profBonus: $profBonus, features: $features, spellcasting: $spellcasting, classSpecific: $classSpecific, index: $index, levelDetailsClass: $levelDetailsClass, url: $url, updatedAt: $updatedAt)';
  }

  factory LevelClassDetails.fromMap(Map<String, dynamic> data) =>
      LevelClassDetails(
        level: data['level'] as int?,
        abilityScoreBonuses: data['ability_score_bonuses'] as int?,
        profBonus: data['prof_bonus'] as int?,
        features: (data['features'] as List<dynamic>?)
            ?.map((e) => Features.fromMap(e as Map<String, dynamic>))
            .toList(),
        spellcasting: data['spellcasting'] == null
            ? null
            : Spellcasting.fromMap(
                data['spellcasting'] as Map<String, dynamic>),
        classSpecific: data['class_specific'] == null
            ? null
            : ClassSpecific.fromMap(
                data['class_specific'] as Map<String, dynamic>),
        index: data['index'] as String?,
        levelDetailsClass: data['class'] == null
            ? null
            : LevelsClass.fromMap(data['class'] as Map<String, dynamic>),
        url: data['url'] as String?,
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
      );

  Map<String, dynamic> toMap() => {
        'level': level,
        'ability_score_bonuses': abilityScoreBonuses,
        'prof_bonus': profBonus,
        'features': features?.map((e) => e.toMap()).toList(),
        'spellcasting': spellcasting?.toMap(),
        'class_specific': classSpecific?.toMap(),
        'index': index,
        'class': levelDetailsClass?.toMap(),
        'url': url,
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LevelClassDetails].
  factory LevelClassDetails.fromJson(String data) {
    return LevelClassDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LevelClassDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  LevelClassDetails copyWith({
    int? level,
    int? abilityScoreBonuses,
    int? profBonus,
    List<Features>? features,
    Spellcasting? spellcasting,
    ClassSpecific? classSpecific,
    String? index,
    LevelsClass? levelDetailsClass,
    String? url,
    DateTime? updatedAt,
  }) {
    return LevelClassDetails(
      level: level ?? this.level,
      abilityScoreBonuses: abilityScoreBonuses ?? this.abilityScoreBonuses,
      profBonus: profBonus ?? this.profBonus,
      features: features ?? this.features,
      spellcasting: spellcasting ?? this.spellcasting,
      classSpecific: classSpecific ?? this.classSpecific,
      index: index ?? this.index,
      levelDetailsClass: levelDetailsClass ?? this.levelDetailsClass,
      url: url ?? this.url,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
