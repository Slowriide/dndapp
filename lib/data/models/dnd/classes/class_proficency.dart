class Proficiency {
  final String index;
  final String name;
  final String url;

  Proficiency({
    required this.index,
    required this.name,
    required this.url,
  });

  factory Proficiency.fromJson(Map<String, dynamic> json) => Proficiency(
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
