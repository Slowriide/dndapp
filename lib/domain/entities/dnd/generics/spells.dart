class Spells {
  final String index;
  final String name;
  final int level;
  final String url;

  Spells({
    required this.index,
    required this.name,
    required this.level,
    required this.url,
  });

  @override
  String toString() {
    return 'Spells(name: $name, type: $index, level: $level, url: $url, )';
  }
}
