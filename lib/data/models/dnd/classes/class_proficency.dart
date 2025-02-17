class ClassProficiency {
  final String index;
  final String name;
  final String url;

  ClassProficiency({
    required this.index,
    required this.name,
    required this.url,
  });

  factory ClassProficiency.fromJson(Map<String, dynamic> json) =>
      ClassProficiency(
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
