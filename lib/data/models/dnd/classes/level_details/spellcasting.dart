import 'dart:convert';

class Spellcasting {
  int? cantripsKnown;
  int? spellsKnown;
  int? spellSlotsLevel1;
  int? spellSlotsLevel2;
  int? spellSlotsLevel3;
  int? spellSlotsLevel4;
  int? spellSlotsLevel5;
  int? spellSlotsLevel6;
  int? spellSlotsLevel7;
  int? spellSlotsLevel8;
  int? spellSlotsLevel9;

  Spellcasting({
    this.cantripsKnown,
    this.spellsKnown,
    this.spellSlotsLevel1,
    this.spellSlotsLevel2,
    this.spellSlotsLevel3,
    this.spellSlotsLevel4,
    this.spellSlotsLevel5,
    this.spellSlotsLevel6,
    this.spellSlotsLevel7,
    this.spellSlotsLevel8,
    this.spellSlotsLevel9,
  });

  @override
  String toString() {
    return 'Spellcasting(cantripsKnown: $cantripsKnown, spellsKnown: $spellsKnown, spellSlotsLevel1: $spellSlotsLevel1, spellSlotsLevel2: $spellSlotsLevel2, spellSlotsLevel3: $spellSlotsLevel3, spellSlotsLevel4: $spellSlotsLevel4, spellSlotsLevel5: $spellSlotsLevel5, spellSlotsLevel6: $spellSlotsLevel6, spellSlotsLevel7: $spellSlotsLevel7, spellSlotsLevel8: $spellSlotsLevel8, spellSlotsLevel9: $spellSlotsLevel9)';
  }

  factory Spellcasting.fromMap(Map<String, dynamic> data) => Spellcasting(
        cantripsKnown: data['cantrips_known'] as int?,
        spellsKnown: data['spells_known'] as int?,
        spellSlotsLevel1: data['spell_slots_level_1'] as int?,
        spellSlotsLevel2: data['spell_slots_level_2'] as int?,
        spellSlotsLevel3: data['spell_slots_level_3'] as int?,
        spellSlotsLevel4: data['spell_slots_level_4'] as int?,
        spellSlotsLevel5: data['spell_slots_level_5'] as int?,
        spellSlotsLevel6: data['spell_slots_level_6'] as int?,
        spellSlotsLevel7: data['spell_slots_level_7'] as int?,
        spellSlotsLevel8: data['spell_slots_level_8'] as int?,
        spellSlotsLevel9: data['spell_slots_level_9'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'cantrips_known': cantripsKnown,
        'spells_known': spellsKnown,
        'spell_slots_level_1': spellSlotsLevel1,
        'spell_slots_level_2': spellSlotsLevel2,
        'spell_slots_level_3': spellSlotsLevel3,
        'spell_slots_level_4': spellSlotsLevel4,
        'spell_slots_level_5': spellSlotsLevel5,
        'spell_slots_level_6': spellSlotsLevel6,
        'spell_slots_level_7': spellSlotsLevel7,
        'spell_slots_level_8': spellSlotsLevel8,
        'spell_slots_level_9': spellSlotsLevel9,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Spellcasting].
  factory Spellcasting.fromJson(String data) {
    return Spellcasting.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Spellcasting] to a JSON string.
  String toJson() => json.encode(toMap());

  Spellcasting copyWith({
    int? cantripsKnown,
    int? spellsKnown,
    int? spellSlotsLevel1,
    int? spellSlotsLevel2,
    int? spellSlotsLevel3,
    int? spellSlotsLevel4,
    int? spellSlotsLevel5,
    int? spellSlotsLevel6,
    int? spellSlotsLevel7,
    int? spellSlotsLevel8,
    int? spellSlotsLevel9,
  }) {
    return Spellcasting(
      cantripsKnown: cantripsKnown ?? this.cantripsKnown,
      spellsKnown: spellsKnown ?? this.spellsKnown,
      spellSlotsLevel1: spellSlotsLevel1 ?? this.spellSlotsLevel1,
      spellSlotsLevel2: spellSlotsLevel2 ?? this.spellSlotsLevel2,
      spellSlotsLevel3: spellSlotsLevel3 ?? this.spellSlotsLevel3,
      spellSlotsLevel4: spellSlotsLevel4 ?? this.spellSlotsLevel4,
      spellSlotsLevel5: spellSlotsLevel5 ?? this.spellSlotsLevel5,
      spellSlotsLevel6: spellSlotsLevel6 ?? this.spellSlotsLevel6,
      spellSlotsLevel7: spellSlotsLevel7 ?? this.spellSlotsLevel7,
      spellSlotsLevel8: spellSlotsLevel8 ?? this.spellSlotsLevel8,
      spellSlotsLevel9: spellSlotsLevel9 ?? this.spellSlotsLevel9,
    );
  }
}
