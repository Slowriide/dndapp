import 'dart:convert';

import 'package:dnd_app/data/models/dnd/subclasses/subclass_details/subclass_class.dart';
import 'package:dnd_app/data/models/dnd/subclasses/subclass_levels/subclass_subclass.dart';

class SubclassFeaturesDetails {
  String? index;
  SubclassClass? subclassFeaturesDetailsClass;
  SubclassSubclass? subclass;
  String? name;
  int? level;
  List<dynamic>? prerequisites;
  List<String>? desc;
  String? url;
  DateTime? updatedAt;

  SubclassFeaturesDetails({
    this.index,
    this.subclassFeaturesDetailsClass,
    this.subclass,
    this.name,
    this.level,
    this.prerequisites,
    this.desc,
    this.url,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'SubclassFeaturesDetails(index: $index, subclassFeaturesDetailsClass: $subclassFeaturesDetailsClass, subclass: $subclass, name: $name, level: $level, prerequisites: $prerequisites, desc: $desc, url: $url, updatedAt: $updatedAt)';
  }

  factory SubclassFeaturesDetails.fromMap(Map<String, dynamic> data) {
    return SubclassFeaturesDetails(
      index: data['index'] as String?,
      subclassFeaturesDetailsClass: data['class'] == null
          ? null
          : SubclassClass.fromMap(data['class'] as Map<String, dynamic>),
      subclass: data['subclass'] == null
          ? null
          : SubclassSubclass.fromMap(data['subclass'] as Map<String, dynamic>),
      name: data['name'] as String?,
      level: data['level'] as int?,
      prerequisites: data['prerequisites'] as List<dynamic>?,
      desc: (data['desc'] as List<dynamic>?)
          ?.map((item) => item.toString())
          .toList(),
      url: data['url'] as String?,
      updatedAt: data['updated_at'] == null
          ? null
          : DateTime.parse(data['updated_at'] as String),
    );
  }

  Map<String, dynamic> toMap() => {
        'index': index,
        'class': subclassFeaturesDetailsClass?.toMap(),
        'subclass': subclass?.toMap(),
        'name': name,
        'level': level,
        'prerequisites': prerequisites,
        'desc': desc,
        'url': url,
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubclassFeaturesDetails].
  factory SubclassFeaturesDetails.fromJson(String data) {
    return SubclassFeaturesDetails.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubclassFeaturesDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  SubclassFeaturesDetails copyWith({
    String? index,
    SubclassClass? subclassFeaturesDetailsClass,
    SubclassSubclass? subclass,
    String? name,
    int? level,
    List<dynamic>? prerequisites,
    List<String>? desc,
    String? url,
    DateTime? updatedAt,
  }) {
    return SubclassFeaturesDetails(
      index: index ?? this.index,
      subclassFeaturesDetailsClass:
          subclassFeaturesDetailsClass ?? this.subclassFeaturesDetailsClass,
      subclass: subclass ?? this.subclass,
      name: name ?? this.name,
      level: level ?? this.level,
      prerequisites: prerequisites ?? this.prerequisites,
      desc: desc ?? this.desc,
      url: url ?? this.url,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
