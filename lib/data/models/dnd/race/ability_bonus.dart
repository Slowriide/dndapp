import 'package:dnd_app/data/models/dnd/race/lenguaje.dart';

class AbilityBonus {
  final Language abilityScore;
  final int bonus;

  AbilityBonus({
    required this.abilityScore,
    required this.bonus,
  });

  factory AbilityBonus.fromJson(Map<String, dynamic> json) => AbilityBonus(
        abilityScore: Language.fromJson(json["ability_score"]),
        bonus: json["bonus"],
      );

  Map<String, dynamic> toJson() => {
        "ability_score": abilityScore.toJson(),
        "bonus": bonus,
      };
}
