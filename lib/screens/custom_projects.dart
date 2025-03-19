// ignore_for_file: library_private_types_in_public_api, deprecated_member_use, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:megahertz_robotics/screens/arduino_screen.dart';
import 'package:megahertz_robotics/screens/esp32_screen.dart';
import 'package:megahertz_robotics/screens/esp8266_screen.dart';

class CustomProjects extends StatefulWidget {
  const CustomProjects({super.key});

  @override
  _CustomProjectsState createState() => _CustomProjectsState();
}

class _CustomProjectsState extends State<CustomProjects>
    with SingleTickerProviderStateMixin {
  final TextEditingController _requirementsController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _bgAnimation;

  @override
  void initState() {
    super.initState();

    // Background animation setup
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    _bgAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _requirementsController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Animated Background Effect
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 255, 178, 0).withOpacity(0.8),
                      const Color.fromARGB(255, 255, 157, 0).withOpacity(0.8),
                    ],
                    stops: [
                      _bgAnimation.value - 0.3,
                      _bgAnimation.value + 0.3,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              );
            },
          ),

          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.white, size: 28),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Title Section
                  Center(
                    child: Text(
                      "Custom Projects",
                      style: TextStyle(
                        fontSize: width > 600 ? 42 : 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: const [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black38,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Responsive Grid for Modules
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return GridView.count(
                        crossAxisCount: width > 900 ? 3 : (width > 600 ? 2 : 1),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.2,
                        children: [
                          _buildModuleCard(
                            context,
                            title: 'ESP32 Projects',
                            imageUrl: 'assets/custom_project/esp32.png',
                            navigateTo: const Esp32Screen(espProjects: [
                              {
                                'name': 'ESP32 Project 1',
                                'imageUrl': 'https://via.placeholder.com/150',
                                'description': 'This is a sample ESP32 project',
                              },
                              {
                                'name': 'ESP32 Project 2',
                                'imageUrl': 'https://via.placeholder.com/150',
                                'description': 'This is a sample ESP32 project',
                              }
                            ]),
                          ),
                          _buildModuleCard(
                            context,
                            title: 'ESP8266 Projects',
                            imageUrl: 'assets/custom_project/esp8266.png',
                            navigateTo: const Esp8266Screen(espProjects: [
                              {
                                'name': 'ESP8266 Project 1',
                                'imageUrl': 'https://via.placeholder.com/150',
                                'description':
                                    'This is a sample ESP8266 project',
                              },
                              {
                                'name': 'ESP8266 Project 2',
                                'imageUrl': 'https://via.placeholder.com/150',
                                'description':
                                    'This is a sample ESP8266 project',
                              },
                            ]),
                          ),
                          _buildModuleCard(
                            context,
                            title: 'Arduino Projects',
                            imageUrl: 'assets/custom_project/arduino.png',
                            navigateTo: const ArduinoScreen(
                              projects: [
                                {
                                  'name': 'Arduino Project 1',
                                  'imageUrl': 'https://via.placeholder.com/150',
                                  'description':
                                      'This is a sample Arduino projec',
                                  'components': 'Resistor, LED, Arduino Uno',
                                  'price': '₹4000',
                                },
                                {
                                  'name': 'Arduino Project 2',
                                  'imageUrl': 'https://via.placeholder.com/150',
                                  'description':
                                      'This is a sample Arduino project',
                                  'components':
                                      'Capacitor, Transistor, Arduino Nano',
                                  'price': '₹6000',
                                },
                                {
                                  'name': 'Arduino Project 3',
                                  'imageUrl': 'https://via.placeholder.com/150',
                                  'description':
                                      'This is a sample Arduino project',
                                  'components': 'Diode, Relay, Arduino Mega',
                                  'price': '₹8000',
                                },
                              ],
                              arduinoProjects: [
                                {
                                  'name': 'Arduino Project 1',
                                  'imageUrl': 'https://via.placeholder.com/150',
                                  'description':
                                      'This is a sample Arduino projec',
                                  'components': 'Resistor, LED, Arduino Uno',
                                  'price': '₹4000',
                                },
                                {
                                  'name': 'Arduino Project 2',
                                  'imageUrl': 'https://via.placeholder.com/150',
                                  'description':
                                      'This is a sample Arduino project',
                                  'components':
                                      'Capacitor, Transistor, Arduino Nano',
                                  'price': '₹6000',
                                },
                                {
                                  'name': 'Arduino Project 3',
                                  'imageUrl': 'https://via.placeholder.com/150',
                                  'description':
                                      'This is a sample Arduino project',
                                  'components': 'Diode, Relay, Arduino Mega',
                                  'price': '₹8000',
                                },
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 40),
                  const CustomProjectOrderForm(),

                  // Custom Project Order Form
                  // Container(
                  //   padding: const EdgeInsets.all(16),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white.withOpacity(0.9),
                  //     borderRadius: BorderRadius.circular(15),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black.withOpacity(0.1),
                  //         blurRadius: 10,
                  //         offset: const Offset(0, 5),
                  //       ),
                  //     ],
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       const Text(
                  //         "Custom Project Order",
                  //         style: TextStyle(
                  //           fontSize: 22,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       const SizedBox(height: 10),
                  //       TextField(
                  //         decoration: const InputDecoration(
                  //           labelText: 'Name',
                  //           border: OutlineInputBorder(),
                  //         ),
                  //         onChanged: (value) =>
                  //             setState(() => _nameController.text = value),
                  //       ),
                  //       const SizedBox(height: 10),
                  //       TextField(
                  //         decoration: const InputDecoration(
                  //           labelText: 'Email',
                  //           border: OutlineInputBorder(),
                  //         ),
                  //         keyboardType: TextInputType.emailAddress,
                  //         onChanged: (value) =>
                  //             setState(() => _emailController.text = value),
                  //       ),
                  //       const SizedBox(height: 10),
                  //       TextField(
                  //         decoration: const InputDecoration(
                  //           labelText: 'Mobile Number',
                  //           border: OutlineInputBorder(),
                  //         ),
                  //         keyboardType: TextInputType.phone,
                  //         onChanged: (value) =>
                  //             setState(() => _mobileController.text = value),
                  //       ),
                  //       const SizedBox(height: 10),
                  //       TextField(
                  //         controller: _requirementsController,
                  //         decoration: const InputDecoration(
                  //           labelText: 'Project Requirements',
                  //           border: OutlineInputBorder(),
                  //         ),
                  //         maxLines: 3,
                  //       ),
                  //       const SizedBox(height: 20),
                  //       Center(
                  //         child: ElevatedButton(
                  //           onPressed: () async {
                  //             try {
                  //               final orderData = {
                  //                 'name': _nameController.text,
                  //                 'email': _emailController.text,
                  //                 'mobile': _mobileController.text,
                  //                 'requirements': _requirementsController.text,
                  //                 'timestamp': FieldValue.serverTimestamp(),
                  //                 'status': 'pending'
                  //               };

                  //               await FirebaseFirestore.instance
                  //                   .collection('custom_orders')
                  //                   .add(orderData);

                  //               _nameController.clear();
                  //               _emailController.clear();
                  //               _mobileController.clear();
                  //               _requirementsController.clear();

                  //               ScaffoldMessenger.of(context).showSnackBar(
                  //                 const SnackBar(
                  //                     content:
                  //                         Text('Order saved successfully!')),
                  //               );
                  //             } catch (e) {
                  //               ScaffoldMessenger.of(context).showSnackBar(
                  //                 SnackBar(
                  //                     content: Text('Error: ${e.toString()}')),
                  //               );
                  //             }
                  //           },
                  //           child: const Text('Place Order'),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  //*  custom project section ends here !!
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Module card builder
  Widget _buildModuleCard(
    BuildContext context, {
    required String title,
    required String imageUrl,
    required Widget navigateTo,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            foreground: Paint()
              ..style = PaintingStyle.fill
              ..shader = const LinearGradient(
                colors: [
                  Color.fromARGB(255, 118, 118, 117),
                  Color.fromARGB(255, 12, 12, 12),
                ],
              ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
            letterSpacing: 0.5,
            shadows: const [
              Shadow(
                blurRadius: 12.0,
                color: Colors.black26,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => navigateTo),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      imageUrl,
                      fit: BoxFit.fitHeight,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomProjectOrderForm extends StatefulWidget {
  const CustomProjectOrderForm({super.key});

  @override
  _CustomProjectOrderFormState createState() => _CustomProjectOrderFormState();
}

class _CustomProjectOrderFormState extends State<CustomProjectOrderForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _requirementsController = TextEditingController();

  bool _isLoading = false; // Loading indicator

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Custom Project Order",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
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
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _mobileController,
            decoration: const InputDecoration(
              labelText: 'Mobile Number',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _requirementsController,
            decoration: const InputDecoration(
              labelText: 'Project Requirements',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 20),
          Center(
            child: _isLoading
                ? const CircularProgressIndicator() // Show loading spinner
                : ElevatedButton(
                    onPressed: _placeOrder,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    child: const Text(
                      'Place Order',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  // Function to place order
  Future<void> _placeOrder() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final mobile = _mobileController.text.trim();
    final requirements = _requirementsController.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        mobile.isEmpty ||
        requirements.isEmpty) {
      _showErrorDialog("Please fill in all fields");
      return;
    }

    setState(() => _isLoading = true);

    try {
      final orderData = {
        'name': name,
        'email': email,
        'mobile': mobile,
        'requirements': requirements,
        'timestamp': FieldValue.serverTimestamp(),
        'status': 'pending'
      };

      // Simulating Firebase order placement
      await FirebaseFirestore.instance
          .collection('custom_orders')
          .add(orderData);

      // Clear form fields
      _nameController.clear();
      _emailController.clear();
      _mobileController.clear();
      _requirementsController.clear();

      // Show confirmation dialog
      _showSuccessDialog();
    } catch (e) {
      _showErrorDialog("Error: ${e.toString()}");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // Show order success dialog
  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent accidental closing
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text(
          "Order Successful!",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text(
          "Your order has been placed successfully.\nExpect a call in 1 hour.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.orange, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  // Show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text(
          "Error",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
