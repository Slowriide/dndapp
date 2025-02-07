class Cost {
  final int quantity;
  final String unit;

  Cost({
    required this.quantity,
    required this.unit,
  });

  factory Cost.fromJson(Map<String, dynamic> json) => Cost(
        quantity: json["quantity"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "unit": unit,
      };
}
