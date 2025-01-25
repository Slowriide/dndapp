class ActionUsage {
  String type; //cada
  String? dice;
  int? minValue;

  ActionUsage({
    required this.type,
    this.dice,
    this.minValue,
  });

  factory ActionUsage.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      // Maneja casos en los que `usage` sea null
      return ActionUsage(type: '', dice: null, minValue: null);
    }
    return ActionUsage(
      type: json["type"] ?? '',
      dice: json["dice"], // Puede ser null
      minValue: json["min_value"], // Puede ser null
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "dice": dice,
        "min_value": minValue,
      };
}
