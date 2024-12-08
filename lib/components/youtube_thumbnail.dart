import 'package:flutter/material.dart';

class ThumbnailCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String imagePath;
  final VoidCallback? onAction1;
  final VoidCallback? onAction2;
  final String action1Text;
  final String action2Text;

  const ThumbnailCard({
    super.key,
    this.title = 'Card Title',
    this.subtitle = 'Secondary Text',
    this.description = 'Default description.',
    required this.imagePath,
    this.onAction1,
    this.onAction2,
    this.action1Text = 'ACTION 1',
    this.action2Text = 'ACTION 2',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: 400, // Fixed width for each card
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.arrow_drop_down_circle),
              title: Text(title),
              subtitle: Text(
                subtitle,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                description,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            OverflowBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF6200EE),
                  ),
                  onPressed: onAction1,
                  child: Text(action1Text),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF6200EE),
                  ),
                  onPressed: onAction2,
                  child: Text(action2Text),
                ),
              ],
            ),
            Image.asset(imagePath),
          ],
        ),
      ),
    );
  }
}
