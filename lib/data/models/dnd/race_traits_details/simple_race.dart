import 'dart:convert';

class SimpleRace {
  String? index;
  String? name;
  String? url;

  SimpleRace({this.index, this.name, this.url});

  @override
  String toString() => 'Race(index: $index, name: $name, url: $url)';

  factory SimpleRace.fromMap(Map<String, dynamic> data) => SimpleRace(
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
  /// Parses the string and returns the resulting Json object as [SimpleRace].
  factory SimpleRace.fromJson(String data) {
    return SimpleRace.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SimpleRace] to a JSON string.
  String toJson() => json.encode(toMap());

  SimpleRace copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return SimpleRace(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
