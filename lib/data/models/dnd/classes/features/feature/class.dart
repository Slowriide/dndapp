import 'dart:convert';

class FeatureClass {
  String? index;
  String? name;
  String? url;

  FeatureClass({this.index, this.name, this.url});

  @override
  String toString() => 'Class(index: $index, name: $name, url: $url)';

  factory FeatureClass.fromMap(Map<String, dynamic> data) => FeatureClass(
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
  /// Parses the string and returns the resulting Json object as [FeatureClass].
  factory FeatureClass.fromJson(String data) {
    return FeatureClass.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [FeatureClass] to a JSON string.
  String toJson() => json.encode(toMap());

  FeatureClass copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return FeatureClass(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
