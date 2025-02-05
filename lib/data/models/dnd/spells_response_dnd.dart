class SpellsDndResponse {
  final String index;
  final String name;
  final int level;
  final String url;

  SpellsDndResponse({
    required this.index,
    required this.name,
    required this.level,
    required this.url,
  });

  factory SpellsDndResponse.fromJson(Map<String, dynamic> json) =>
      SpellsDndResponse(
        index: json["index"],
        name: json["name"],
        level: json["level"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "name": name,
        "level": level,
        "url": url,
      };
}
