import 'dart:convert';

class RacialTrait {
  String? index;
  String? name;
  String? url;

  RacialTrait({this.index, this.name, this.url});

  @override
  String toString() => 'RacialTrait(index: $index, name: $name, url: $url)';

  factory RacialTrait.fromMap(Map<String, dynamic> data) => RacialTrait(
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
  /// Parses the string and returns the resulting Json object as [RacialTrait].
  factory RacialTrait.fromJson(String data) {
    return RacialTrait.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RacialTrait] to a JSON string.
  String toJson() => json.encode(toMap());

  RacialTrait copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return RacialTrait(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
