import 'package:dnd_app/data/models/dnd/classes/my_proficency_choice.dart';
import 'package:dnd_app/data/models/dnd/stats/proficency.dart';

class MultiClassing {
  final List<Prerequisite> prerequisites;
  final List<Proficiency> proficiencies;

  MultiClassing({
    required this.prerequisites,
    required this.proficiencies,
  });

  factory MultiClassing.fromJson(Map<String, dynamic> json) => MultiClassing(
        prerequisites: List<Prerequisite>.from(
            json["prerequisites"].map((x) => Prerequisite.fromJson(x))),
        proficiencies: List<Proficiency>.from(
            json["proficiencies"].map((x) => Proficiency.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "prerequisites":
            List<dynamic>.from(prerequisites.map((x) => x.toJson())),
        "proficiencies":
            List<dynamic>.from(proficiencies.map((x) => x.toJson())),
      };
}

class Prerequisite {
  final Proficiency abilityScore;
  final int minimumScore;

  Prerequisite({
    required this.abilityScore,
    required this.minimumScore,
  });

  factory Prerequisite.fromJson(Map<String, dynamic> json) => Prerequisite(
        abilityScore: Proficiency.fromJson(json["ability_score"]),
        minimumScore: json["minimum_score"],
      );

  Map<String, dynamic> toJson() => {
        "ability_score": abilityScore.toJson(),
        "minimum_score": minimumScore,
      };
}
