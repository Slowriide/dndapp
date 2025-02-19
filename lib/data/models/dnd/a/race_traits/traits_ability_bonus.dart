import 'dart:convert';

import 'ability_score.dart';

class TraitsAbilityBonus {
  AbilityScore? abilityScore;
  int? bonus;

  TraitsAbilityBonus({this.abilityScore, this.bonus});

  @override
  String toString() {
    return 'AbilityBonus(abilityScore: $abilityScore, bonus: $bonus)';
  }

  factory TraitsAbilityBonus.fromMap(Map<String, dynamic> data) =>
      TraitsAbilityBonus(
        abilityScore: data['ability_score'] == null
            ? null
            : AbilityScore.fromMap(
                data['ability_score'] as Map<String, dynamic>),
        bonus: data['bonus'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'ability_score': abilityScore?.toMap(),
        'bonus': bonus,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TraitsAbilityBonus].
  factory TraitsAbilityBonus.fromJson(String data) {
    return TraitsAbilityBonus.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TraitsAbilityBonus] to a JSON string.
  String toJson() => json.encode(toMap());

  TraitsAbilityBonus copyWith({
    AbilityScore? abilityScore,
    int? bonus,
  }) {
    return TraitsAbilityBonus(
      abilityScore: abilityScore ?? this.abilityScore,
      bonus: bonus ?? this.bonus,
    );
  }
}
