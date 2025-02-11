import 'dart:convert';

class Proficiency {
  String? index;
  String? name;
  String? url;

  Proficiency({this.index, this.name, this.url});

  @override
  String toString() => 'Proficiency(index: $index, name: $name, url: $url)';

  factory Proficiency.fromMap(Map<String, dynamic> data) => Proficiency(
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
  /// Parses the string and returns the resulting Json object as [Proficiency].
  factory Proficiency.fromJson(String data) {
    return Proficiency.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Proficiency] to a JSON string.
  String toJson() => json.encode(toMap());

  Proficiency copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return Proficiency(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
