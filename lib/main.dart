import 'package:firebase_core/firebase_core.dart';
import 'package:megahertz_robotics/screens/custom_projects.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Make sure to initialize Firebase with FirebaseOptions for Web.
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAwLhxqIgzSEx8c_EYyKVDwkWl5Eud9hKY",
        authDomain: "megahertzmainwebsite.firebaseapp.com",
        projectId: "megahertzmainwebsite",
        storageBucket: "megahertzmainwebsite.firebasestorage.app",
        messagingSenderId: "413685409021",
        appId: "1:413685409021:web:dee6b5f95e208ff5610a94",
        measurementId: "G-HF76PDPBBL"),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MegaHertz Robotics',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
          useMaterial3: true,
        ),
        home: const CustomProjects());
    // home: const HomePage());
  }
}

// FCC623
