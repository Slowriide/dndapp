class Action {
  final String name;
  final String description;

  Action({
    required this.name,
    required this.description,
  });

  factory Action.fromJson(Map<String, dynamic> json) => Action(
        name: json["name"],
        description: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "desc": description,
      };
}
