class Backgrounds {
  final String index;
  final String name;
  final String url;

  Backgrounds({
    required this.index,
    required this.name,
    required this.url,
  });

  @override
  String toString() {
    return 'Backgrounds(name: $name, type: $index, url: $url, )';
  }
}
