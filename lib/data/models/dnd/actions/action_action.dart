class ActionAction {
  String actionName; //bite
  int count; //1
  String type; //melee

  ActionAction({
    required this.actionName,
    required this.count,
    required this.type,
  });

  factory ActionAction.fromJson(Map<String, dynamic> json) => ActionAction(
        actionName: json["action_name"],
        count: json["count"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "action_name": actionName,
        "count": count,
        "type": type,
      };
}
