import 'dart:convert';

class Info {
  String? name;
  List<String>? desc;

  Info({this.name, this.desc});

  @override
  String toString() => 'Info(name: $name, desc: $desc)';

  factory Info.fromMap(Map<String, dynamic> data) => Info(
        name: data['name'] as String?,
        desc: data['desc'] as List<String>?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'desc': desc,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Info].
  factory Info.fromJson(String data) {
    return Info.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Info] to a JSON string.
  String toJson() => json.encode(toMap());

  Info copyWith({
    String? name,
    List<String>? desc,
  }) {
    return Info(
      name: name ?? this.name,
      desc: desc ?? this.desc,
    );
  }
}
