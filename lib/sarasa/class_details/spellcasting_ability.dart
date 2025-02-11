import 'dart:convert';

class SpellcastingAbility {
  String? index;
  String? name;
  String? url;

  SpellcastingAbility({this.index, this.name, this.url});

  @override
  String toString() {
    return 'SpellcastingAbility(index: $index, name: $name, url: $url)';
  }

  factory SpellcastingAbility.fromMap(Map<String, dynamic> data) {
    return SpellcastingAbility(
      index: data['index'] as String?,
      name: data['name'] as String?,
      url: data['url'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'index': index,
        'name': name,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SpellcastingAbility].
  factory SpellcastingAbility.fromJson(String data) {
    return SpellcastingAbility.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SpellcastingAbility] to a JSON string.
  String toJson() => json.encode(toMap());

  SpellcastingAbility copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return SpellcastingAbility(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
