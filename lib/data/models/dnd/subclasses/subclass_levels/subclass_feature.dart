import 'dart:convert';

class SubclassLevelsFeature {
  String? index;
  String? name;
  String? url;

  SubclassLevelsFeature({this.index, this.name, this.url});

  @override
  String toString() => 'Feature(index: $index, name: $name, url: $url)';

  factory SubclassLevelsFeature.fromMap(Map<String, dynamic> data) =>
      SubclassLevelsFeature(
        index: data['index'] as String?,
        name: data['name'] as String?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'index': index,
        'name': name,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubclassLevelsFeature].
  factory SubclassLevelsFeature.fromJson(String data) {
    return SubclassLevelsFeature.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubclassLevelsFeature] to a JSON string.
  String toJson() => json.encode(toMap());

  SubclassLevelsFeature copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return SubclassLevelsFeature(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
