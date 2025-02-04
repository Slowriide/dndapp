class Book {
  final String name;
  final String subtitle;
  final String imagePath;
  final bool isFav;
  final bool isFree;
  final double price;
  final BookType bookType;
  final List<Tags> tags;

  Book({
    required this.name,
    required this.subtitle,
    required this.imagePath,
    required this.isFav,
    required this.isFree,
    required this.price,
    required this.bookType,
    required this.tags,
  });
}

enum BookType {
  sourcebooks,
  adventures,
}

enum Tags {
  recent,
  sale,
  free,
}
