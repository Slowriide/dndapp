import 'dart:convert';

class AbilityScore {
  String? index;
  String? name;
  String? url;

  AbilityScore({this.index, this.name, this.url});

  @override
  String toString() => 'AbilityScore(index: $index, name: $name, url: $url)';

  factory AbilityScore.fromMap(Map<String, dynamic> data) => AbilityScore(
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
  /// Parses the string and returns the resulting Json object as [AbilityScore].
  factory AbilityScore.fromJson(String data) {
    return AbilityScore.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AbilityScore] to a JSON string.
  String toJson() => json.encode(toMap());

  AbilityScore copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return AbilityScore(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
