import 'dart:convert';

class SubclassClass {
  String? index;
  String? name;
  String? url;

  SubclassClass({this.index, this.name, this.url});

  @override
  String toString() => 'Class(index: $index, name: $name, url: $url)';

  factory SubclassClass.fromMap(Map<String, dynamic> data) => SubclassClass(
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
  /// Parses the string and returns the resulting Json object as [SubclassClass].
  factory SubclassClass.fromJson(String data) {
    return SubclassClass.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubclassClass] to a JSON string.
  String toJson() => json.encode(toMap());

  SubclassClass copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return SubclassClass(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
