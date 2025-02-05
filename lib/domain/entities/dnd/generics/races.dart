class Races {
  final String index;
  final String name;
  final String url;

  Races({
    required this.index,
    required this.name,
    required this.url,
  });

  @override
  String toString() {
    return 'Races(name: $name, type: $index, url: $url, )';
  }
}
