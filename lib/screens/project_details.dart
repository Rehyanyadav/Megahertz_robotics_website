import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> project;

  const ProjectDetailsScreen({super.key, required this.project});

  @override
  _ProjectDetailsScreenState createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;

    // Fallback values to handle nulls
    final projectName = project['name'] ?? 'Unknown Project';
    final projectDesc = project['description'] ?? 'No description available.';
    final imageUrl =
        project['imageUrl'] ?? 'assets/custom_project/placeholder.png';
    final components = project['components'] ?? 'No components listed';
    final price = project['price'] ?? '₹0';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(projectName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[300],
                    width: double.infinity,
                    height: 250,
                    child: const Center(
                      child:
                          Icon(Icons.broken_image, size: 60, color: Colors.red),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Project Name
            Text(
              projectName,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            // Project Description
            Text(
              projectDesc,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
            ),

            const SizedBox(height: 20),

            // Components Section
            const Text(
              "Components Included:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            // Display components as chips or text
            if (components is String)
              Text(
                components,
                style: const TextStyle(fontSize: 18, color: Colors.black87),
              )
            else if (components is List)
              Wrap(
                spacing: 10,
                children: components
                    .map<Widget>(
                      (comp) => Chip(
                        label: Text(comp),
                        backgroundColor: Colors.blue.shade100,
                      ),
                    )
                    .toList(),
              ),

            const SizedBox(height: 20),

            // Price Section
            Text(
              "Price: $price",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 30),

            // Order Form
            const Text(
              "Place Your Order",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Order Button
            Center(
              child: ElevatedButton(
                onPressed: _isLoading ? null : () => _placeOrder(project),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Order Now',
                        style: TextStyle(fontSize: 18),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _placeOrder(Map<String, dynamic> project) async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();

    if (name.isEmpty || email.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    await FirebaseFirestore.instance.collection('orders').add({
      'name': name,
      'email': email,
      'phone': phone,
      'project': project['name'],
      'price': project['price'] ?? '₹0',
      'timestamp': Timestamp.now(),
      'status': 'pending',
    });

    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
  }
}
