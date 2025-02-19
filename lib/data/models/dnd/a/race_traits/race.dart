import 'dart:convert';

class Race {
  String? index;
  String? name;
  String? url;

  Race({this.index, this.name, this.url});

  @override
  String toString() => 'Race(index: $index, name: $name, url: $url)';

  factory Race.fromMap(Map<String, dynamic> data) => Race(
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
  /// Parses the string and returns the resulting Json object as [Race].
  factory Race.fromJson(String data) {
    return Race.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Race] to a JSON string.
  String toJson() => json.encode(toMap());

  Race copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return Race(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
