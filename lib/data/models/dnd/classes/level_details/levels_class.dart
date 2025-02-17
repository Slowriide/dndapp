import 'dart:convert';

class LevelsClass {
  String? index;
  String? name;
  String? url;

  LevelsClass({this.index, this.name, this.url});

  @override
  String toString() => 'LevelsClass(index: $index, name: $name, url: $url)';

  factory LevelsClass.fromMap(Map<String, dynamic> data) => LevelsClass(
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
  /// Parses the string and returns the resulting Json object as [LevelsClass].
  factory LevelsClass.fromJson(String data) {
    return LevelsClass.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Class] to a JSON string.
  String toJson() => json.encode(toMap());

  LevelsClass copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return LevelsClass(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
