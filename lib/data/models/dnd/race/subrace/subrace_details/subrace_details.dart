import 'dart:convert';

import 'package:dnd_app/data/models/dnd/race/ability_bonus.dart';
import 'package:dnd_app/data/models/dnd/race/starting_prof.dart';

import 'language_options.dart';
import 'subrace_race.dart';
import 'racial_trait.dart';

class SubraceDetails {
  String? index;
  String? name;
  SubraceRace? race;
  String? desc;
  List<AbilityBonus>? abilityBonuses;
  List<StartingProficencies>? startingProficiencies;
  List<dynamic>? languages;
  LanguageOptions? languageOptions;
  List<RacialTrait>? racialTraits;
  String? url;
  DateTime? updatedAt;

  SubraceDetails({
    this.index,
    this.name,
    this.race,
    this.desc,
    this.abilityBonuses,
    this.startingProficiencies,
    this.languages,
    this.languageOptions,
    this.racialTraits,
    this.url,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'SubraceDetails(index: $index, name: $name, race: $race, desc: $desc, abilityBonuses: $abilityBonuses, startingProficiencies: $startingProficiencies, languages: $languages, languageOptions: $languageOptions, racialTraits: $racialTraits, url: $url, updatedAt: $updatedAt)';
  }

  factory SubraceDetails.fromMap(Map<String, dynamic> data) {
    return SubraceDetails(
      index: data['index'] as String?,
      name: data['name'] as String?,
      race: data['race'] == null
          ? null
          : SubraceRace.fromMap(data['race'] as Map<String, dynamic>),
      desc: data['desc'] as String?,
      abilityBonuses: (data['ability_bonuses'] as List<dynamic>?)
          ?.map((e) => AbilityBonus.fromJson(e as Map<String, dynamic>))
          .toList(),
      startingProficiencies: (data['starting_proficiencies'] as List<dynamic>?)
          ?.map((e) => StartingProficencies.fromJson(e as Map<String, dynamic>))
          .toList(),
      languages: data['languages'] as List<dynamic>?,
      languageOptions: data['language_options'] == null
          ? null
          : LanguageOptions.fromMap(
              data['language_options'] as Map<String, dynamic>),
      racialTraits: (data['racial_traits'] as List<dynamic>?)
          ?.map((e) => RacialTrait.fromMap(e as Map<String, dynamic>))
          .toList(),
      url: data['url'] as String?,
      updatedAt: data['updated_at'] == null
          ? null
          : DateTime.parse(data['updated_at'] as String),
    );
  }

  Map<String, dynamic> toMap() => {
        'index': index,
        'name': name,
        'race': race?.toMap(),
        'desc': desc,
        'ability_bonuses': abilityBonuses?.map((e) => e.toJson()).toList(),
        'starting_proficiencies':
            startingProficiencies?.map((e) => e.toJson()).toList(),
        'languages': languages,
        'language_options': languageOptions?.toMap(),
        'racial_traits': racialTraits?.map((e) => e.toMap()).toList(),
        'url': url,
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubraceDetails].
  factory SubraceDetails.fromJson(String data) {
    return SubraceDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubraceDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  SubraceDetails copyWith({
    String? index,
    String? name,
    SubraceRace? race,
    String? desc,
    List<AbilityBonus>? abilityBonuses,
    List<StartingProficencies>? startingProficiencies,
    List<dynamic>? languages,
    LanguageOptions? languageOptions,
    List<RacialTrait>? racialTraits,
    String? url,
    DateTime? updatedAt,
  }) {
    return SubraceDetails(
      index: index ?? this.index,
      name: name ?? this.name,
      race: race ?? this.race,
      desc: desc ?? this.desc,
      abilityBonuses: abilityBonuses ?? this.abilityBonuses,
      startingProficiencies:
          startingProficiencies ?? this.startingProficiencies,
      languages: languages ?? this.languages,
      languageOptions: languageOptions ?? this.languageOptions,
      racialTraits: racialTraits ?? this.racialTraits,
      url: url ?? this.url,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
