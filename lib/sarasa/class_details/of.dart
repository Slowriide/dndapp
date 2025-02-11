import 'dart:convert';

class Of {
  String? index;
  String? name;
  String? url;

  Of({this.index, this.name, this.url});

  @override
  String toString() => 'Of(index: $index, name: $name, url: $url)';

  factory Of.fromMap(Map<String, dynamic> data) => Of(
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
  /// Parses the string and returns the resulting Json object as [Of].
  factory Of.fromJson(String data) {
    return Of.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Of] to a JSON string.
  String toJson() => json.encode(toMap());

  Of copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return Of(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
