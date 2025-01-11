class ArmorClass {
  final String type;
  final int value;

  ArmorClass({
    required this.type,
    required this.value,
  });

  @override
  String toString() {
    return 'ArmorClass(type: $type, value: $value)';
  }
}
