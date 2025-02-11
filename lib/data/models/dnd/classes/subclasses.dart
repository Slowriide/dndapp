class Subclasses {
  final String index;
  final String name;
  final String url;

  Subclasses({
    required this.index,
    required this.name,
    required this.url,
  });

  factory Subclasses.fromJson(Map<String, dynamic> json) => Subclasses(
        index: json["index"] ?? '',
        name: json["name"] ?? '',
        url: json["url"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "name": name,
        "url": url,
      };
}
