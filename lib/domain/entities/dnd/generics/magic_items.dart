class MagicItems {
  final String index;
  final String name;
  final String url;

  MagicItems({
    required this.index,
    required this.name,
    required this.url,
  });

  @override
  String toString() {
    return 'MagicItem(name: $name, type: $index, url: $url, )';
  }
}
