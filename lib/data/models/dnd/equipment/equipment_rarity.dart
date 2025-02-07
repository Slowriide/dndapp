class Rarity {
  final String name;

  Rarity({
    required this.name,
  });

  factory Rarity.fromJson(Map<String, dynamic> json) => Rarity(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };

  static defaultRarity() {
    return 'Unknow';
  }
}
