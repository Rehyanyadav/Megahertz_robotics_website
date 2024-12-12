// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NavbarDesktop extends StatefulWidget {
  const NavbarDesktop({super.key});

  @override
  State<NavbarDesktop> createState() => _NavbarDesktopState();
}

class _NavbarDesktopState extends State<NavbarDesktop> {
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
            height: 500.0, // Set the desired height
          ),
          const Spacer(),
          const Spacer(),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () async {
                      // Open link action
                      final Uri url = Uri.parse(
                          'https://alphacodes101.github.io/megahertz_ordering_system/');

                      if (await canLaunch(url.toString())) {
                        launch(url.toString());
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text(
                      'Buy Products',
                      style: TextStyle(
                          fontSize: 25.0,
                          color: const Color.fromARGB(255, 255, 196, 0),
                          fontStyle: GoogleFonts.agbalumo().fontStyle),
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
