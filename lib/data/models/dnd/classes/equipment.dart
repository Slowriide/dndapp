class Equipment {
  final String index;
  final String name;
  final String url;

  Equipment({
    required this.index,
    required this.name,
    required this.url,
  });

  factory Equipment.fromJson(Map<String, dynamic> json) => Equipment(
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
