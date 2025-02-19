import 'dart:convert';

class StartingProficiency {
  String? index;
  String? name;
  String? url;

  StartingProficiency({this.index, this.name, this.url});

  @override
  String toString() {
    return 'StartingProficiency(index: $index, name: $name, url: $url)';
  }

  factory StartingProficiency.fromMap(Map<String, dynamic> data) {
    return StartingProficiency(
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
  /// Parses the string and returns the resulting Json object as [StartingProficiency].
  factory StartingProficiency.fromJson(String data) {
    return StartingProficiency.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [StartingProficiency] to a JSON string.
  String toJson() => json.encode(toMap());

  StartingProficiency copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return StartingProficiency(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
