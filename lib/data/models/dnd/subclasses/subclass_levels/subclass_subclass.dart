import 'dart:convert';

class SubclassSubclass {
  String? index;
  String? name;
  String? url;

  SubclassSubclass({this.index, this.name, this.url});

  @override
  String toString() => 'Subclass(index: $index, name: $name, url: $url)';

  factory SubclassSubclass.fromMap(Map<String, dynamic> data) =>
      SubclassSubclass(
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
  /// Parses the string and returns the resulting Json object as [SubclassSubclass].
  factory SubclassSubclass.fromJson(String data) {
    return SubclassSubclass.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubclassSubclass] to a JSON string.
  String toJson() => json.encode(toMap());

  SubclassSubclass copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return SubclassSubclass(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
