import 'dart:convert';

import 'subclass_class.dart';

class SubclassDetails {
  String? index;
  SubclassClass? subclassDetailsClass;
  String? name;
  String? subclassFlavor;
  List<String>? desc;
  String? subclassLevels;
  String? url;
  DateTime? updatedAt;
  List<dynamic>? spells;

  SubclassDetails({
    this.index,
    this.subclassDetailsClass,
    this.name,
    this.subclassFlavor,
    this.desc,
    this.subclassLevels,
    this.url,
    this.updatedAt,
    this.spells,
  });

  @override
  String toString() {
    return 'SubclassDetails(index: $index, subclassDetailsClass: $subclassDetailsClass, name: $name, subclassFlavor: $subclassFlavor, desc: $desc, subclassLevels: $subclassLevels, url: $url, updatedAt: $updatedAt, spells: $spells)';
  }

  factory SubclassDetails.fromMap(Map<String, dynamic> data) {
    return SubclassDetails(
      index: data['index'] as String?,
      subclassDetailsClass: data['class'] == null
          ? null
          : SubclassClass.fromMap(data['class'] as Map<String, dynamic>),
      name: data['name'] as String?,
      subclassFlavor: data['subclass_flavor'] as String?,
      desc: (data['desc'] as List<dynamic>?)
          ?.map((item) => item.toString())
          .toList(),
      subclassLevels: data['subclass_levels'] as String?,
      url: data['url'] as String?,
      updatedAt: data['updated_at'] == null
          ? null
          : DateTime.parse(data['updated_at'] as String),
      spells: data['spells'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toMap() => {
        'index': index,
        'class': subclassDetailsClass?.toMap(),
        'name': name,
        'subclass_flavor': subclassFlavor,
        'desc': desc,
        'subclass_levels': subclassLevels,
        'url': url,
        'updated_at': updatedAt?.toIso8601String(),
        'spells': spells,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubclassDetails].
  factory SubclassDetails.fromJson(String data) {
    return SubclassDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubclassDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  SubclassDetails copyWith({
    String? index,
    SubclassClass? subclassDetailsClass,
    String? name,
    String? subclassFlavor,
    List<String>? desc,
    String? subclassLevels,
    String? url,
    DateTime? updatedAt,
    List<dynamic>? spells,
  }) {
    return SubclassDetails(
      index: index ?? this.index,
      subclassDetailsClass: subclassDetailsClass ?? this.subclassDetailsClass,
      name: name ?? this.name,
      subclassFlavor: subclassFlavor ?? this.subclassFlavor,
      desc: desc ?? this.desc,
      subclassLevels: subclassLevels ?? this.subclassLevels,
      url: url ?? this.url,
      updatedAt: updatedAt ?? this.updatedAt,
      spells: spells ?? this.spells,
    );
  }
}
