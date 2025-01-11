class GenericDndResponse {
  final String index;
  final String name;
  final String url;

  GenericDndResponse({
    required this.index,
    required this.name,
    required this.url,
  });

  factory GenericDndResponse.fromJson(Map<String, dynamic> json) =>
      GenericDndResponse(
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
