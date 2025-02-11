import 'dart:convert';

import 'ability_score.dart';

class Prerequisite {
  AbilityScore? abilityScore;
  int? minimumScore;

  Prerequisite({this.abilityScore, this.minimumScore});

  @override
  String toString() {
    return 'Prerequisite(abilityScore: $abilityScore, minimumScore: $minimumScore)';
  }

  factory Prerequisite.fromMap(Map<String, dynamic> data) => Prerequisite(
        abilityScore: data['ability_score'] == null
            ? null
            : AbilityScore.fromMap(
                data['ability_score'] as Map<String, dynamic>),
        minimumScore: data['minimum_score'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'ability_score': abilityScore?.toMap(),
        'minimum_score': minimumScore,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Prerequisite].
  factory Prerequisite.fromJson(String data) {
    return Prerequisite.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Prerequisite] to a JSON string.
  String toJson() => json.encode(toMap());

  Prerequisite copyWith({
    AbilityScore? abilityScore,
    int? minimumScore,
  }) {
    return Prerequisite(
      abilityScore: abilityScore ?? this.abilityScore,
      minimumScore: minimumScore ?? this.minimumScore,
    );
  }
}
