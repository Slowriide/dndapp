class ClassEquipment {
  final String index;
  final String name;
  final String url;

  ClassEquipment({
    required this.index,
    required this.name,
    required this.url,
  });

  factory ClassEquipment.fromJson(Map<String, dynamic> json) => ClassEquipment(
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
