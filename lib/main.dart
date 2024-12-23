import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:megahertz_robotics/screens/splash_screen.dart';
import 'package:meta_seo/meta_seo.dart';

import 'screens/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    MetaSEO().config();
  }

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
        home: const SplashScreen());
    // home: const HomePage());
  }
}



// FCC623 



 