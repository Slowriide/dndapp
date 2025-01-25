class DamageType {
  String index; //lightning
  String name; //lightning
  String url; // "/api/damage-types/lightning"

  DamageType({
    required this.index,
    required this.name,
    required this.url,
  });

  factory DamageType.fromJson(Map<String, dynamic> json) => DamageType(
        index: json["index"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "name": name,
        "url": url,
      };
}
