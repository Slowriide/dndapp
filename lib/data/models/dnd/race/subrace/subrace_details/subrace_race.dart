import 'dart:convert';

class SubraceRace {
  String? index;
  String? name;
  String? url;

  SubraceRace({this.index, this.name, this.url});

  @override
  String toString() => 'Race(index: $index, name: $name, url: $url)';

  factory SubraceRace.fromMap(Map<String, dynamic> data) => SubraceRace(
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
  /// Parses the string and returns the resulting Json object as [SubraceRace].
  factory SubraceRace.fromJson(String data) {
    return SubraceRace.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubraceRace] to a JSON string.
  String toJson() => json.encode(toMap());

  SubraceRace copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return SubraceRace(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
