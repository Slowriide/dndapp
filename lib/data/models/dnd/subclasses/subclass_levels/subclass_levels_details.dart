import 'dart:convert';

import 'package:dnd_app/data/models/dnd/subclasses/subclass_details/subclass_class.dart';

import 'subclass_feature.dart';
import 'subclass_subclass.dart';
import 'subclass_specific.dart';

class SubclassLevelsDetails {
  int? level;
  List<SubclassLevelsFeature>? features;
  SubclassSpecific? subclassSpecific;
  SubclassClass? subclassLevelsClass;
  SubclassSubclass? subclass;
  String? url;
  String? index;
  DateTime? updatedAt;

  SubclassLevelsDetails({
    this.level,
    this.features,
    this.subclassSpecific,
    this.subclassLevelsClass,
    this.subclass,
    this.url,
    this.index,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'SubclassLevels(level: $level, features: $features, subclassSpecific: $subclassSpecific, subclassLevelsClass: $subclassLevelsClass, subclass: $subclass, url: $url, index: $index, updatedAt: $updatedAt)';
  }

  factory SubclassLevelsDetails.fromMap(Map<String, dynamic> data) {
    return SubclassLevelsDetails(
      level: data['level'] as int?,
      features: (data['features'] as List<dynamic>?)
          ?.map((e) => SubclassLevelsFeature.fromMap(e as Map<String, dynamic>))
          .toList(),
      subclassSpecific: data['subclass_specific'] == null
          ? null
          : SubclassSpecific.fromMap(
              data['subclass_specific'] as Map<String, dynamic>),
      subclassLevelsClass: data['class'] == null
          ? null
          : SubclassClass.fromMap(data['class'] as Map<String, dynamic>),
      subclass: data['subclass'] == null
          ? null
          : SubclassSubclass.fromMap(data['subclass'] as Map<String, dynamic>),
      url: data['url'] as String?,
      index: data['index'] as String?,
      updatedAt: data['updated_at'] == null
          ? null
          : DateTime.parse(data['updated_at'] as String),
    );
  }

  Map<String, dynamic> toMap() => {
        'level': level,
        'features': features?.map((e) => e.toMap()).toList(),
        'subclass_specific': subclassSpecific?.toMap(),
        'class': subclassLevelsClass?.toMap(),
        'subclass': subclass?.toMap(),
        'url': url,
        'index': index,
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubclassLevelsDetails].
  factory SubclassLevelsDetails.fromJson(String data) {
    return SubclassLevelsDetails.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubclassLevelsDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  SubclassLevelsDetails copyWith({
    int? level,
    List<SubclassLevelsFeature>? features,
    SubclassSpecific? subclassSpecific,
    SubclassClass? subclassLevelsClass,
    SubclassSubclass? subclass,
    String? url,
    String? index,
    DateTime? updatedAt,
  }) {
    return SubclassLevelsDetails(
      level: level ?? this.level,
      features: features ?? this.features,
      subclassSpecific: subclassSpecific ?? this.subclassSpecific,
      subclassLevelsClass: subclassLevelsClass ?? this.subclassLevelsClass,
      subclass: subclass ?? this.subclass,
      url: url ?? this.url,
      index: index ?? this.index,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
