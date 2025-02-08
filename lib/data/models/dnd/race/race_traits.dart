class RaceTraits {
  final String index;
  final String name;
  final String url;

  RaceTraits({
    required this.index,
    required this.name,
    required this.url,
  });

  factory RaceTraits.fromJson(Map<String, dynamic> json) => RaceTraits(
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
