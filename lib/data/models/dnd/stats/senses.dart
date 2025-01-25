class Senses {
  final String? blindsight;
  final String? darkvision;
  final int passivePerception;

  Senses({
    required this.blindsight,
    required this.darkvision,
    required this.passivePerception,
  });

  factory Senses.fromJson(Map<String, dynamic> json) => Senses(
        blindsight: json["blindsight"] ?? '',
        darkvision: json["darkvision"] ?? '',
        passivePerception: json["passive_perception"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "blindsight": blindsight,
        "darkvision": darkvision,
        "passive_perception": passivePerception,
      };
}
