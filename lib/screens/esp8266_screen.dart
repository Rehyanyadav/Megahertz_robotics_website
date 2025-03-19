import 'package:flutter/material.dart';
import 'package:megahertz_robotics/screens/project_details.dart';

class Esp8266Screen extends StatelessWidget {
  final List<Map<String, dynamic>> espProjects;

  const Esp8266Screen({super.key, required this.espProjects});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('ESP32 Projects'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: espProjects.length,
        itemBuilder: (context, index) {
          var espProject = espProjects[index];

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
                  espProject['imageUrl'],
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                espProject['name'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                espProject['description'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProjectDetailsScreen(project: espProject),
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
