class MyStartingEquipmentOption {
  final String desc;
  final int choose;

  MyStartingEquipmentOption({
    required this.desc,
    required this.choose,
  });

  factory MyStartingEquipmentOption.fromJson(Map<String, dynamic> json) =>
      MyStartingEquipmentOption(
        desc: json["desc"] ?? '',
        choose: json["choose"] ?? 1,
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "choose": choose,
      };
}
