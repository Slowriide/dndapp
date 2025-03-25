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
        actionName: json["action_name"] ?? '',
        count: _parseCount(json["count"]),
        type: json["type"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "action_name": actionName,
        "count": count,
        "type": type,
      };

  // Función para manejar la conversión de count
  static int _parseCount(dynamic count) {
    if (count is String) {
      return int.tryParse(count) ??
          0; // Convierte el string a int, o usa 0 si no es válido
    }
    return count is int ? count : 0; // Si es un int ya, simplemente lo devuelve
  }
}
