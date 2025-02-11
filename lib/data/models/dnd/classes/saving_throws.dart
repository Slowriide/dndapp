class SavingThrows {
  final String index;
  final String name;
  final String url;

  SavingThrows({
    required this.index,
    required this.name,
    required this.url,
  });

  factory SavingThrows.fromJson(Map<String, dynamic> json) => SavingThrows(
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
