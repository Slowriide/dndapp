import 'package:dnd_app/data/models/dnd/damage/dc_type_class.dart';

class Proficiency {
  final int value;
  final DcTypeClass proficiency;

  Proficiency({
    required this.value,
    required this.proficiency,
  });

  factory Proficiency.fromJson(Map<String, dynamic> json) => Proficiency(
        value: json["value"],
        proficiency: DcTypeClass.fromJson(json["proficiency"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "proficiency": proficiency.toJson(),
      };
}
