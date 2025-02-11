import 'dart:convert';

class Equipment {
  String? index;
  String? name;
  String? url;

  Equipment({this.index, this.name, this.url});

  @override
  String toString() => 'Equipment(index: $index, name: $name, url: $url)';

  factory Equipment.fromMap(Map<String, dynamic> data) => Equipment(
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
  /// Parses the string and returns the resulting Json object as [Equipment].
  factory Equipment.fromJson(String data) {
    return Equipment.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Equipment] to a JSON string.
  String toJson() => json.encode(toMap());

  Equipment copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return Equipment(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
