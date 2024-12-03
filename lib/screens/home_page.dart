import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:megahertz_robotics/components/carisoule.dart';
import 'package:megahertz_robotics/desktop/about_us_desktop.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math';
import '../components/drawer_mobile_tab.dart';
import '../constants/size.dart';
import '../desktop/navbar_desktop.dart';

import '../mobile/about_section_mobile.dart';
import '../mobile/nav_bar_mobile_tab.dart';

// Import statements organized and unused imports removed

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // Constants moved to class level
  static const _animationDuration = Duration(milliseconds: 1000);
  static const colorizeColors = [
    Color.fromARGB(255, 0, 255, 200),
    Colors.blue,
    Color.fromARGB(255, 59, 255, 95),
    Colors.red,
  ];

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scrollController = ScrollController();
  final _sectionOneKey = GlobalKey();
  final _sectionTwoKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= KMinDesktopWidth;
        return Scaffold(
          backgroundColor: Colors.black,
          key: _scaffoldKey,
          endDrawer: isDesktop ? null : const DrawerMobileTab(),
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    _buildNavbar(isDesktop),

                    //* CARISOULE Starts here
                    ResponsiveCarousel(
                      items: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 100.0),
                              child: Center(
                                child: Text('OUR ACHIVEMENTS',
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                GoogleFonts.abel().fontFamily))
                                    .animate()
                                    .shimmer(
                                        color: Colors.amber,
                                        duration: const Duration(seconds: 3)),
                              ),
                            ),
                            Center(child: Image.asset('assets/logo.png')),
                          ],
                        ),
                        Image.asset('assets/logo.png'),
                        Image.asset('assets/logo.png'),
                      ],
                    )
                        .animate()
                        .scale(
                            duration: const Duration(seconds: 2),
                            curve: Curves.fastOutSlowIn)
                        .then()
                        .shimmer(
                            color: Colors.amber,
                            duration: const Duration(seconds: 3)),
                    const SizedBox(
                      height: 20,
                    ),

                    //* CARISOULE Ends here

                    //* ABOUT Sections
                    Center(
                            child: Text('About US ',
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: GoogleFonts.abel().fontFamily)))
                        .animate()
                        .scale(
                            duration: const Duration(seconds: 2),
                            curve: Curves.fastOutSlowIn)
                        .then()
                        .shimmer(
                            color: Colors.amber,
                            duration: const Duration(seconds: 3)),

                    _buildAboutSection(isDesktop),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavbar(bool isDesktop) {
    return isDesktop
        ? const NavbarDesktop()
        : NavbarMobileTab(
            onmenuTap: () => _scaffoldKey.currentState?.openEndDrawer(),
          );
  }
}

Widget _buildAboutSection(bool isDesktop) {
  return isDesktop ? const AboutSectionDesktop() : const AboutSectionMobTab();
}
