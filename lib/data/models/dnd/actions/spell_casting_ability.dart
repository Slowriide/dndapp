class SpellCastingAbility {
  final String index;
  final String name;
  final String url;

  SpellCastingAbility({
    required this.index,
    required this.name,
    required this.url,
  });

  factory SpellCastingAbility.fromJson(Map<String, dynamic> json) =>
      SpellCastingAbility(
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
