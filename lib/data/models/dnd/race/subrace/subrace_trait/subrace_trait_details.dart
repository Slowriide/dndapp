import 'dart:convert';

import 'subrace.dart';
import 'trait_specific.dart';

class SubraceTraitDetails {
  String? index;
  List<dynamic>? races;
  List<TraitsSubrace>? subraces;
  String? name;
  List<String>? desc;
  List<dynamic>? proficiencies;
  TraitSpecific? traitSpecific;
  String? url;
  DateTime? updatedAt;

  SubraceTraitDetails({
    this.index,
    this.races,
    this.subraces,
    this.name,
    this.desc,
    this.proficiencies,
    this.traitSpecific,
    this.url,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'SubraceTrait(index: $index, races: $races, subraces: $subraces, name: $name, desc: $desc, proficiencies: $proficiencies, traitSpecific: $traitSpecific, url: $url, updatedAt: $updatedAt)';
  }

  factory SubraceTraitDetails.fromMap(Map<String, dynamic> data) =>
      SubraceTraitDetails(
        index: data['index'] as String?,
        races: data['races'] as List<dynamic>?,
        subraces: (data['subraces'] as List<dynamic>?)
            ?.map((e) => TraitsSubrace.fromMap(e as Map<String, dynamic>))
            .toList(),
        name: data['name'] as String?,
        desc: (data['desc'] as List<dynamic>?)
            ?.map((item) => item.toString())
            .toList(),
        proficiencies: data['proficiencies'] as List<dynamic>?,
        traitSpecific: data['trait_specific'] == null
            ? null
            : TraitSpecific.fromMap(
                data['trait_specific'] as Map<String, dynamic>),
        url: data['url'] as String?,
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
      );

  Map<String, dynamic> toMap() => {
        'index': index,
        'races': races,
        'subraces': subraces?.map((e) => e.toMap()).toList(),
        'name': name,
        'desc': desc,
        'proficiencies': proficiencies,
        'trait_specific': traitSpecific?.toMap(),
        'url': url,
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubraceTraitDetails].
  factory SubraceTraitDetails.fromJson(String data) {
    return SubraceTraitDetails.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubraceTraitDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  SubraceTraitDetails copyWith({
    String? index,
    List<dynamic>? races,
    List<TraitsSubrace>? subraces,
    String? name,
    List<String>? desc,
    List<dynamic>? proficiencies,
    TraitSpecific? traitSpecific,
    String? url,
    DateTime? updatedAt,
  }) {
    return SubraceTraitDetails(
      index: index ?? this.index,
      races: races ?? this.races,
      subraces: subraces ?? this.subraces,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      proficiencies: proficiencies ?? this.proficiencies,
      traitSpecific: traitSpecific ?? this.traitSpecific,
      url: url ?? this.url,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
