import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavbarDesktop extends StatefulWidget {
  const NavbarDesktop({super.key});

  @override
  State<NavbarDesktop> createState() => _NavbarDesktopState();
}

class _NavbarDesktopState extends State<NavbarDesktop> {
  var colorizeColors = [
    Colors.purple,
    Colors.blue,
    const Color.fromARGB(255, 92, 59, 255),
    const Color.fromARGB(255, 54, 231, 244),
  ];

  TextStyle colorizeTextStyle = const TextStyle(
    fontSize: 40.0,
    fontFamily: 'Horizon',
  );

  TextStyle smallText = const TextStyle(
    fontSize: 25.0,
    fontFamily: 'Horizon',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 100.0),
      height: 100,
      width: double.maxFinite,
      child: Row(
        children: [
          Image.asset(
            'assets/logo.png',
            width: 200.0, // Set the desired width
            height: 200.0, // Set the desired height
          ),
          const Spacer(),
          const Spacer(),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Buy Products',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Color.fromARGB(255, 255, 196, 0),
                      ),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Customized Products',
                      style: TextStyle(
                        fontStyle: GoogleFonts.abel().fontStyle,
                        fontSize: 25.0,
                        color: const Color.fromARGB(255, 255, 196, 0),
                      ),
                    )),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Tutorials ',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Color.fromARGB(255, 255, 196, 0),
                      ),
                    )),
              ])
        ],
      ),
    );
  }
}
