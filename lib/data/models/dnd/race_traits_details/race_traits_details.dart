import 'dart:convert';

import 'simple_race.dart';

class RaceTraitsDetails {
  String? index;
  List<SimpleRace>? races;
  List<dynamic>? subraces;
  String? name;
  List<String>? desc;
  List<dynamic>? proficiencies;
  String? url;
  DateTime? updatedAt;

  RaceTraitsDetails({
    this.index,
    this.races,
    this.subraces,
    this.name,
    this.desc,
    this.proficiencies,
    this.url,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'RaceTraitsDetails(index: $index, races: $races, subraces: $subraces, name: $name, desc: $desc, proficiencies: $proficiencies, url: $url, updatedAt: $updatedAt)';
  }

  factory RaceTraitsDetails.fromMap(Map<String, dynamic> data) {
    return RaceTraitsDetails(
      index: data['index'] as String?,
      races: (data['races'] as List<dynamic>?)
          ?.map((e) => SimpleRace.fromMap(e as Map<String, dynamic>))
          .toList(),
      subraces: data['subraces'] as List<dynamic>?,
      name: data['name'] as String?,
      desc: (data['desc'] as List<dynamic>?)
          ?.map((item) => item.toString())
          .toList(),
      proficiencies: data['proficiencies'] as List<dynamic>?,
      url: data['url'] as String?,
      updatedAt: data['updated_at'] == null
          ? null
          : DateTime.parse(data['updated_at'] as String),
    );
  }

  Map<String, dynamic> toMap() => {
        'index': index,
        'races': races?.map((e) => e.toMap()).toList(),
        'subraces': subraces,
        'name': name,
        'desc': desc,
        'proficiencies': proficiencies,
        'url': url,
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RaceTraitsDetails].
  factory RaceTraitsDetails.fromJson(String data) {
    return RaceTraitsDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RaceTraitsDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  RaceTraitsDetails copyWith({
    String? index,
    List<SimpleRace>? races,
    List<dynamic>? subraces,
    String? name,
    List<String>? desc,
    List<dynamic>? proficiencies,
    String? url,
    DateTime? updatedAt,
  }) {
    return RaceTraitsDetails(
      index: index ?? this.index,
      races: races ?? this.races,
      subraces: subraces ?? this.subraces,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      proficiencies: proficiencies ?? this.proficiencies,
      url: url ?? this.url,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
