import 'dart:convert';

class LevelFeature {
  String? index;
  String? name;
  String? url;

  LevelFeature({this.index, this.name, this.url});

  @override
  String toString() => 'Feature(index: $index, name: $name, url: $url)';

  factory LevelFeature.fromMap(Map<String, dynamic> data) => LevelFeature(
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
  /// Parses the string and returns the resulting Json object as [LevelFeature].
  factory LevelFeature.fromJson(String data) {
    return LevelFeature.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LevelFeature] to a JSON string.
  String toJson() => json.encode(toMap());

  LevelFeature copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return LevelFeature(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
