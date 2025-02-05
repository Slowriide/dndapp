class Feats {
  final String index;
  final String name;
  final String url;

  Feats({
    required this.index,
    required this.name,
    required this.url,
  });

  @override
  String toString() {
    return 'Feats(name: $name, type: $index, url: $url, )';
  }
}
