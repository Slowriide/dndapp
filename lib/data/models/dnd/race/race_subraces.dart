class RaceSubraces {
  final String index;
  final String name;
  final String url;

  RaceSubraces({
    required this.index,
    required this.name,
    required this.url,
  });

  factory RaceSubraces.fromJson(Map<String, dynamic> json) => RaceSubraces(
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
