class DcTypeClass {
  String index; //dex
  String name; //DEX
  String url; // "/api/ability-scores/dex"

  DcTypeClass({
    required this.index,
    required this.name,
    required this.url,
  });

  factory DcTypeClass.fromJson(Map<String, dynamic> json) => DcTypeClass(
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
