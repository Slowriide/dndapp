import 'dart:convert';

class SneakAttack {
  final int? diceCount;
  final int? diceValue;

  const SneakAttack({this.diceCount, this.diceValue});

  @override
  String toString() {
    return 'SneakAttack(diceCount: $diceCount, diceValue: $diceValue)';
  }

  factory SneakAttack.fromMap(Map<String, dynamic> data) => SneakAttack(
        diceCount: data['dice_count'] as int?,
        diceValue: data['dice_value'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'dice_count': diceCount,
        'dice_value': diceValue,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SneakAttack].
  factory SneakAttack.fromJson(String data) {
    return SneakAttack.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SneakAttack] to a JSON string.
  String toJson() => json.encode(toMap());

  SneakAttack copyWith({
    int? diceCount,
    int? diceValue,
  }) {
    return SneakAttack(
      diceCount: diceCount ?? this.diceCount,
      diceValue: diceValue ?? this.diceValue,
    );
  }
}
