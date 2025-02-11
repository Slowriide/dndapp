import 'dart:convert';

class EquipmentCategory {
  String? index;
  String? name;
  String? url;

  EquipmentCategory({this.index, this.name, this.url});

  @override
  String toString() {
    return 'EquipmentCategory(index: $index, name: $name, url: $url)';
  }

  factory EquipmentCategory.fromMap(Map<String, dynamic> data) {
    return EquipmentCategory(
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
  /// Parses the string and returns the resulting Json object as [EquipmentCategory].
  factory EquipmentCategory.fromJson(String data) {
    return EquipmentCategory.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [EquipmentCategory] to a JSON string.
  String toJson() => json.encode(toMap());

  EquipmentCategory copyWith({
    String? index,
    String? name,
    String? url,
  }) {
    return EquipmentCategory(
      index: index ?? this.index,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
