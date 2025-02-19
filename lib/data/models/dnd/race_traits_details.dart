import 'dart:convert';

import 'a/race_traits/traits_ability_bonus.dart';
import 'a/race_traits/language_options.dart';
import 'a/race_traits/race.dart';
import 'a/race_traits/racial_trait.dart';
import 'a/race_traits/starting_proficiency.dart';

class RaceTraitsDetails {
  String? index;
  String? name;
  Race? race;
  String? desc;
  List<TraitsAbilityBonus>? abilityBonuses;
  List<StartingProficiency>? startingProficiencies;
  List<dynamic>? languages;
  LanguageOptions? languageOptions;
  List<RacialTrait>? racialTraits;
  String? url;
  DateTime? updatedAt;

  RaceTraitsDetails({
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
    return 'ClassTraits(index: $index, name: $name, race: $race, desc: $desc, abilityBonuses: $abilityBonuses, startingProficiencies: $startingProficiencies, languages: $languages, languageOptions: $languageOptions, racialTraits: $racialTraits, url: $url, updatedAt: $updatedAt)';
  }

  factory RaceTraitsDetails.fromMap(Map<String, dynamic> data) =>
      RaceTraitsDetails(
        index: data['index'] as String?,
        name: data['name'] as String?,
        race: data['race'] == null
            ? null
            : Race.fromMap(data['race'] as Map<String, dynamic>),
        desc: data['desc'] as String?,
        abilityBonuses: (data['ability_bonuses'] as List<dynamic>?)
            ?.map((e) => TraitsAbilityBonus.fromMap(e as Map<String, dynamic>))
            .toList(),
        startingProficiencies: (data['starting_proficiencies']
                as List<dynamic>?)
            ?.map((e) => StartingProficiency.fromMap(e as Map<String, dynamic>))
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

  Map<String, dynamic> toMap() => {
        'index': index,
        'name': name,
        'race': race?.toMap(),
        'desc': desc,
        'ability_bonuses': abilityBonuses?.map((e) => e.toMap()).toList(),
        'starting_proficiencies':
            startingProficiencies?.map((e) => e.toMap()).toList(),
        'languages': languages,
        'language_options': languageOptions?.toMap(),
        'racial_traits': racialTraits?.map((e) => e.toMap()).toList(),
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
    String? name,
    Race? race,
    String? desc,
    List<TraitsAbilityBonus>? abilityBonuses,
    List<StartingProficiency>? startingProficiencies,
    List<dynamic>? languages,
    LanguageOptions? languageOptions,
    List<RacialTrait>? racialTraits,
    String? url,
    DateTime? updatedAt,
  }) {
    return RaceTraitsDetails(
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
