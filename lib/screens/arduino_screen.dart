import 'package:flutter/material.dart';
import 'project_details.dart';

class ArduinoScreen extends StatelessWidget {
  final List<Map<String, dynamic>> arduinoProjects;

  const ArduinoScreen({super.key, required this.arduinoProjects, required List<Map<String, String>> projects});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Arduino Projects'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: arduinoProjects.length,
        itemBuilder: (context, index) {
          var project = arduinoProjects[index];

          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  project['imageUrl'],
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[300],
                    width: 100,
                    height: 100,
                    child: const Icon(Icons.broken_image, color: Colors.red),
                  ),
                ),
              ),
              title: Text(
                project['name'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                project['description'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProjectDetailsScreen(project: project),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
