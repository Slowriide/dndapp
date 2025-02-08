class Language {
  final String index;
  final String name;
  final String url;

  Language({
    required this.index,
    required this.name,
    required this.url,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
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
