import 'package:dnd_app/domain/entities/dnd/book.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String price;
  final List<Tags> tags; // Ejemplo: ["NEW", "SALE"]

  const BookItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.tags,
    super.key,
  });

  Color _getTagColor(Tags tag) {
    switch (tag) {
      case Tags.free:
        return Colors.green;
      case Tags.recent:
        return Colors.red;
      case Tags.sale:
        return Colors.blue;
    }
  }

  String _getTagText(Tags tag) {
    switch (tag) {
      case Tags.free:
        return 'FREE';
      case Tags.recent:
        return 'NEW';
      case Tags.sale:
        return 'SALE';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xff293743),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del libro
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              height: 170,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // Información del libro
          Expanded(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //tags
                    Row(
                      children: tags.map((tag) {
                        return Container(
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: _getTagColor(tag),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            _getTagText(tag),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 8),
                    // Título del libro
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                    const SizedBox(height: 4),

                    // Subtítulo o autor
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Precio
                    Text(
                      'US\$ $price',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w100,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
                // Botón "Go to Marketplace"
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff293743),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'Go to Marketplace',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
