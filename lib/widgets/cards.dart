import 'package:flutter/material.dart';

class ImageCardWidget extends StatelessWidget {
  final List<CardItem> cardItems;
  final double cardWidth;
  final double cardHeight;

  const ImageCardWidget({
    super.key,
    required this.cardItems,
    this.cardWidth = 250,
    this.cardHeight = 300,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: cardItems.map((item) => _buildSingleCard(item)).toList(),
      ),
    );
  }

  Widget _buildSingleCard(CardItem item) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: item.onTap,
          child: SizedBox(
            width: cardWidth,
            height: cardHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image section
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    item.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),

                // Title section
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Card Item Model
class CardItem {
  final String imagePath;
  final String title;
  final VoidCallback? onTap;

  CardItem({
    required this.imagePath,
    required this.title,
    this.onTap,
  });
}
