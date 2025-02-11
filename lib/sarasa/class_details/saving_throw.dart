import 'dart:convert';

class SavingThrow {
  String? index;
  String? name;
  String? url;

  SavingThrow({this.index, this.name, this.url});

  @override
  String toString() => 'SavingThrow(index: $index, name: $name, url: $url)';

  factory SavingThrow.fromMap(Map<String, dynamic> data) => SavingThrow(
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
  /// Parses the string and returns the resulting Json object as [SavingThrow].
  factory SavingThrow.fromJson(String data) {
    return SavingThrow.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SavingThrow] to a JSON string.
  String toJson() => json.encode(toMap());

  SavingThrow copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return SavingThrow(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
