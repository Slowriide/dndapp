import 'dart:convert';

class Subclass {
  String? index;
  String? name;
  String? url;

  Subclass({this.index, this.name, this.url});

  @override
  String toString() => 'Subclass(index: $index, name: $name, url: $url)';

  factory Subclass.fromMap(Map<String, dynamic> data) => Subclass(
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
  /// Parses the string and returns the resulting Json object as [Subclass].
  factory Subclass.fromJson(String data) {
    return Subclass.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Subclass] to a JSON string.
  String toJson() => json.encode(toMap());

  Subclass copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return Subclass(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
