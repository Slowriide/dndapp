class StartingProficencies {
  final String index;
  final String name;
  final String url;

  StartingProficencies({
    required this.index,
    required this.name,
    required this.url,
  });

  factory StartingProficencies.fromJson(Map<String, dynamic> json) =>
      StartingProficencies(
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
