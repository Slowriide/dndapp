import 'dart:convert';

import 'class.dart';

class Feature {
  String? index;
  FeatureClass? featureClass;
  String? name;
  int? level;
  List<dynamic>? prerequisites;
  List<String>? desc;
  String? url;
  DateTime? updatedAt;

  Feature({
    this.index,
    this.featureClass,
    this.name,
    this.level,
    this.prerequisites,
    this.desc,
    this.url,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Feature(index: $index, featureClass: $featureClass, name: $name, level: $level, prerequisites: $prerequisites, desc: $desc, url: $url, updatedAt: $updatedAt)';
  }

  factory Feature.fromMap(Map<String, dynamic> data) => Feature(
        index: data['index'] as String?,
        featureClass: data['class'] == null
            ? null
            : FeatureClass.fromMap(data['class'] as Map<String, dynamic>),
        name: data['name'] as String?,
        level: data['level'] as int?,
        prerequisites: data['prerequisites'] as List<dynamic>?,
        desc: data['desc'] as List<String>?,
        url: data['url'] as String?,
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
      );

  Map<String, dynamic> toMap() => {
        'index': index,
        'class': featureClass?.toMap(),
        'name': name,
        'level': level,
        'prerequisites': prerequisites,
        'desc': desc,
        'url': url,
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Feature].
  factory Feature.fromJson(String data) {
    return Feature.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Feature] to a JSON string.
  String toJson() => json.encode(toMap());

  Feature copyWith({
    String? index,
    FeatureClass? featureClass,
    String? name,
    int? level,
    List<dynamic>? prerequisites,
    List<String>? desc,
    String? url,
    DateTime? updatedAt,
  }) {
    return Feature(
      index: index ?? this.index,
      featureClass: featureClass ?? this.featureClass,
      name: name ?? this.name,
      level: level ?? this.level,
      prerequisites: prerequisites ?? this.prerequisites,
      desc: desc ?? this.desc,
      url: url ?? this.url,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
