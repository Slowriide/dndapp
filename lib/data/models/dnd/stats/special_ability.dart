class SpecialAbility {
  String name;
  String desc;

  SpecialAbility({
    required this.name,
    required this.desc,
  });

  factory SpecialAbility.fromJson(Map<String, dynamic> json) => SpecialAbility(
        name: json["name"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "desc": desc,
      };
}
