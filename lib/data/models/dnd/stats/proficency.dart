import 'package:dnd_app/data/models/dnd/damage/dc_type_class.dart';

class Proficiency {
  final int value;
  final DcTypeClass? proficiency;

  Proficiency({
    required this.value,
    required this.proficiency,
  });

  factory Proficiency.fromJson(Map<String, dynamic> json) => Proficiency(
        value: json["value"] ?? 1,
        proficiency: (json["proficiency"] is Map<String, dynamic>)
            ? DcTypeClass.fromJson(json["proficiency"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "proficiency": proficiency?.toJson(),
      };
}
