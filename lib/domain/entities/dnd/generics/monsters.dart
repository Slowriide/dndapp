class Monsters {
  final String index;
  final String name;
  final String url;

  Monsters({
    required this.index,
    required this.name,
    required this.url,
  });

  @override
  String toString() {
    return 'Monster(name: $name, type: $index, url: $url, )';
  }
}
