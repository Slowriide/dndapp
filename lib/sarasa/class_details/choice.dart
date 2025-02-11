import 'dart:convert';

import 'from.dart';

class Choice {
  String? desc;
  int? choose;
  String? type;
  From? from;

  Choice({this.desc, this.choose, this.type, this.from});

  @override
  String toString() {
    return 'Choice(desc: $desc, choose: $choose, type: $type, from: $from)';
  }

  factory Choice.fromMap(Map<String, dynamic> data) => Choice(
        desc: data['desc'] as String?,
        choose: data['choose'] as int?,
        type: data['type'] as String?,
        from: data['from'] == null
            ? null
            : From.fromMap(data['from'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'desc': desc,
        'choose': choose,
        'type': type,
        'from': from?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Choice].
  factory Choice.fromJson(String data) {
    return Choice.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Choice] to a JSON string.
  String toJson() => json.encode(toMap());

  Choice copyWith({
    String? desc,
    int? choose,
    String? type,
    From? from,
  }) {
    return Choice(
      desc: desc ?? this.desc,
      choose: choose ?? this.choose,
      type: type ?? this.type,
      from: from ?? this.from,
    );
  }
}
