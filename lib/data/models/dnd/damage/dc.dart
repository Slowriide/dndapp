import 'package:dnd_app/data/models/dnd/damage/dc_type_class.dart';

class Dc {
  DcTypeClass dcType; //dex
  int dcValue; //19
  String successType; //half

  Dc({
    required this.dcType,
    required this.dcValue,
    required this.successType,
  });

  factory Dc.fromJson(Map<String, dynamic> json) => Dc(
        dcType: DcTypeClass.fromJson(json["dc_type"]),
        dcValue: json["dc_value"],
        successType: json["success_type"],
      );

  Map<String, dynamic> toJson() => {
        "dc_type": dcType.toJson(),
        "dc_value": dcValue,
        "success_type": successType,
      };
}
