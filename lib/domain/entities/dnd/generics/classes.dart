class Classes {
  final String index;
  final String name;
  final String url;

  Classes({
    required this.index,
    required this.name,
    required this.url,
  });

  @override
  String toString() {
    return 'Class(name: $name, type: $index, url: $url, )';
  }
}
