import 'dart:convert';

import 'prerequisite.dart';
import 'proficiency.dart';

class MultiClassing {
  List<Prerequisite>? prerequisites;
  List<Proficiency>? proficiencies;

  MultiClassing({this.prerequisites, this.proficiencies});

  @override
  String toString() {
    return 'MultiClassing(prerequisites: $prerequisites, proficiencies: $proficiencies)';
  }

  factory MultiClassing.fromMap(Map<String, dynamic> data) => MultiClassing(
        prerequisites: (data['prerequisites'] as List<dynamic>?)
            ?.map((e) => Prerequisite.fromMap(e as Map<String, dynamic>))
            .toList(),
        proficiencies: (data['proficiencies'] as List<dynamic>?)
            ?.map((e) => Proficiency.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'prerequisites': prerequisites?.map((e) => e.toMap()).toList(),
        'proficiencies': proficiencies?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MultiClassing].
  factory MultiClassing.fromJson(String data) {
    return MultiClassing.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MultiClassing] to a JSON string.
  String toJson() => json.encode(toMap());

  MultiClassing copyWith({
    List<Prerequisite>? prerequisites,
    List<Proficiency>? proficiencies,
  }) {
    return MultiClassing(
      prerequisites: prerequisites ?? this.prerequisites,
      proficiencies: proficiencies ?? this.proficiencies,
    );
  }
}
