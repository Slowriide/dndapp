class StartingEquipmentOption {
  final String desc;
  final int choose;

  StartingEquipmentOption({
    required this.desc,
    required this.choose,
  });

  factory StartingEquipmentOption.fromJson(Map<String, dynamic> json) =>
      StartingEquipmentOption(
        desc: json["desc"],
        choose: json["choose"],
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "choose": choose,
      };
}
