class EquipmentCategory {
  final String index;
  final String name;
  final String url;

  EquipmentCategory({
    required this.index,
    required this.name,
    required this.url,
  });

  factory EquipmentCategory.fromJson(Map<String, dynamic> json) =>
      EquipmentCategory(
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
