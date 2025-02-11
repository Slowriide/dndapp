class MyProficiencyChoice {
  final String desc;
  final int choose;
  final List<ProficiencyItem>? options;

  MyProficiencyChoice({
    required this.desc,
    required this.choose,
    required this.options,
  });

  factory MyProficiencyChoice.fromJson(Map<String, dynamic> json) =>
      MyProficiencyChoice(
        desc: json["desc"] ?? '',
        choose: json["choose"] ?? 1,
        options: (json["from"]["options"] as List<dynamic>? ?? [])
            .map((option) => ProficiencyItem.fromJson(option["item"]))
            .toList(), // Si es null, retorna lista vacía
      );
}

class ProficiencyItem {
  final String index;
  final String name;

  ProficiencyItem({
    required this.index,
    required this.name,
  });

  factory ProficiencyItem.fromJson(Map<String, dynamic> json) {
    return ProficiencyItem(
      index: json["index"] ?? "",
      name: json["name"] ?? "",
    );
  }
}
