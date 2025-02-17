import 'dart:convert';

class Features {
  String? index;
  String? name;
  String? url;

  Features({this.index, this.name, this.url});

  @override
  String toString() => 'Feature(index: $index, name: $name, url: $url)';

  factory Features.fromMap(Map<String, dynamic> data) => Features(
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
  /// Parses the string and returns the resulting Json object as [Features].
  factory Features.fromJson(String data) {
    return Features.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Features] to a JSON string.
  String toJson() => json.encode(toMap());

  Features copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return Features(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
