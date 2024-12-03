import 'package:flutter/material.dart';
import 'package:megahertz_robotics/screens/home_page.dart';
import 'package:megahertz_robotics/screens/splash_screen.dart';

// ignore: unused_import, depend_on_referenced_packages
import 'package:shared_preferences_web/shared_preferences_web.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 132, 0)),
          useMaterial3: true,
        ),
        // home: const SplashScreen());
        home: const HomePage());
  }
}


// FCC623 



 