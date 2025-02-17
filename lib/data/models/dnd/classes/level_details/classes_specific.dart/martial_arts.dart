import 'dart:convert';

class MartialArts {
  int? diceCount;
  int? diceValue;

  MartialArts({this.diceCount, this.diceValue});

  @override
  String toString() {
    return 'MartialArts(diceCount: $diceCount, diceValue: $diceValue)';
  }

  factory MartialArts.fromMap(Map<String, dynamic> data) => MartialArts(
        diceCount: data['dice_count'] as int?,
        diceValue: data['dice_value'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'dice_count': diceCount,
        'dice_value': diceValue,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MartialArts].
  factory MartialArts.fromJson(String data) {
    return MartialArts.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MartialArts] to a JSON string.
  String toJson() => json.encode(toMap());

  MartialArts copyWith({
    int? diceCount,
    int? diceValue,
  }) {
    return MartialArts(
      diceCount: diceCount ?? this.diceCount,
      diceValue: diceValue ?? this.diceValue,
    );
  }
}
