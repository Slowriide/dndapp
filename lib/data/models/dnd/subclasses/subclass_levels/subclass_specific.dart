import 'dart:convert';

class SubclassSpecific {
  //bard
  int? additionalMagicalSecretsMaxLvl;
  //Paladin
  int? auraRange;

  SubclassSpecific({
    this.additionalMagicalSecretsMaxLvl,
    this.auraRange,
  });

  @override
  String toString() {
    return '''
SubclassSpecific(additionalMagicalSecretsMaxLvl: $additionalMagicalSecretsMaxLvl)
SubclassSpecific(auraRange: $auraRange)
    ''';
  }

  factory SubclassSpecific.fromMap(Map<String, dynamic> data) {
    return SubclassSpecific(
      additionalMagicalSecretsMaxLvl:
          data['additional_magical_secrets_max_lvl'] as int?,
      auraRange: data['aura_range'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'additional_magical_secrets_max_lvl': additionalMagicalSecretsMaxLvl,
        'aura_range': auraRange,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubclassSpecific].
  factory SubclassSpecific.fromJson(String data) {
    return SubclassSpecific.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubclassSpecific] to a JSON string.
  String toJson() => json.encode(toMap());

  SubclassSpecific copyWith({
    int? additionalMagicalSecretsMaxLvl,
  }) {
    return SubclassSpecific(
      additionalMagicalSecretsMaxLvl:
          additionalMagicalSecretsMaxLvl ?? this.additionalMagicalSecretsMaxLvl,
    );
  }
}
