import 'package:dnd_app/data/models/dnd/stats/proficency.dart';

class MyProficiencyChoice {
  final String desc;
  final int choose;
  final List<Proficiency> items; // Ahora es una lista de Proficiency

  MyProficiencyChoice({
    required this.desc,
    required this.choose,
    required this.items,
  });

  factory MyProficiencyChoice.fromJson(Map<String, dynamic> json) =>
      MyProficiencyChoice(
        desc: json["desc"],
        choose: json["choose"],
        items: (json["from"]["options"] as List<dynamic>?)
                ?.map((option) => Proficiency.fromJson(option["item"]))
                .toList() ??
            [], // Si es null, retorna lista vacía
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "choose": choose,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}
