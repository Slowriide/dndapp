import 'package:dnd_app/data/models/dnd/class_details.dart';
import 'package:dnd_app/data/models/dnd/stats/proficency.dart';

class MultiClassing {
  final List<Prerequisite> prerequisites;
  final List<Proficiency> proficiencies;
  final List<ProficiencyChoice> proficiencyChoices;

  MultiClassing({
    required this.prerequisites,
    required this.proficiencies,
    required this.proficiencyChoices,
  });

  factory MultiClassing.fromJson(Map<String, dynamic> json) => MultiClassing(
        prerequisites: json["prerequisites"] != null
            ? List<Prerequisite>.from((json["prerequisites"] as List)
                .map((x) => Prerequisite.fromJson(x)))
            : [],
        proficiencies: json["proficiencies"] != null
            ? List<Proficiency>.from((json["proficiencies"] as List)
                .map((x) => Proficiency.fromJson(x)))
            : [],
        proficiencyChoices: json["proficiency_choices"] != null
            ? List<ProficiencyChoice>.from(json["proficiency_choices"]
                .map((x) => ProficiencyChoice.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "prerequisites":
            List<dynamic>.from(prerequisites.map((x) => x.toJson())),
        "proficiencies":
            List<dynamic>.from(proficiencies.map((x) => x.toJson())),
        "proficiency_choices":
            List<dynamic>.from(proficiencies.map((x) => x.toJson())),
      };
}

class Prerequisite {
  final Proficiency? abilityScore;
  final int minimumScore;

  Prerequisite({
    required this.abilityScore,
    required this.minimumScore,
  });

  factory Prerequisite.fromJson(Map<String, dynamic> json) => Prerequisite(
        abilityScore: json["ability_score"] != null &&
                json["ability_score"] is Map<String, dynamic>
            ? Proficiency.fromJson(json["ability_score"])
            : null,
        minimumScore: json["minimum_score"] ?? 1,
      );

  Map<String, dynamic> toJson() => {
        "ability_score": abilityScore?.toJson(),
        "minimum_score": minimumScore,
      };
}
