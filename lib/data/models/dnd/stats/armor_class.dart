class ArmorClass {
  final String type;
  final int value;

  ArmorClass({
    required this.type,
    required this.value,
  });

  // Método para construir una instancia desde un JSON
  factory ArmorClass.fromJson(Map<String, dynamic> json) {
    return ArmorClass(
      type: json['type'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
      };
}
