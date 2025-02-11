import 'dart:convert';

class Item {
  String? index;
  String? name;
  String? url;

  Item({this.index, this.name, this.url});

  @override
  String toString() => 'Item(index: $index, name: $name, url: $url)';

  factory Item.fromMap(Map<String, dynamic> data) => Item(
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
  /// Parses the string and returns the resulting Json object as [Item].
  factory Item.fromJson(String data) {
    return Item.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());

  Item copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return Item(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
