import 'dart:convert';

class TraitsSubrace {
  String? index;
  String? name;
  String? url;

  TraitsSubrace({this.index, this.name, this.url});

  @override
  String toString() => 'Subrace(index: $index, name: $name, url: $url)';

  factory TraitsSubrace.fromMap(Map<String, dynamic> data) => TraitsSubrace(
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
  /// Parses the string and returns the resulting Json object as [TraitsSubrace].
  factory TraitsSubrace.fromJson(String data) {
    return TraitsSubrace.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TraitsSubrace] to a JSON string.
  String toJson() => json.encode(toMap());

  TraitsSubrace copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return TraitsSubrace(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
