// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:megahertz_robotics/components/carisoule.dart';
import 'package:megahertz_robotics/desktop/about_us_desktop.dart';

import '../components/drawer_mobile_tab.dart';
import '../components/sections_headline_text.dart';
import '../constants/size.dart';
import '../desktop/navbar_desktop.dart';

import '../desktop/products_section_desktop.dart';
import '../mobile/about_section_mobile.dart';
import '../mobile/nav_bar_mobile_tab.dart';
import '../mobile/products_section_mobile.dart';

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
                      height: 50,
                    ),

                    //* CARISOULE Ends here

                    //* ABOUT Sections
                    BorderBeam(
                      duration: 7, // 7-second animation cycle
                      colorFrom: Colors.blue,
                      colorTo: Colors.purple,
                      staticBorderColor: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        width: 400,
                        height: 50,
                        child: const Center(
                          child: Text(
                            'A B O U T  U S',
                            style: TextStyle(color: Colors.amber, fontSize: 40),
                          ),
                        ),
                      ),
                    )
                        .animate()
                        .scale(
                            duration: const Duration(seconds: 3),
                            curve: Curves.fastOutSlowIn)
                        .then()
                        .shimmer(
                            color: Colors.amber,
                            duration: const Duration(seconds: 4)),

                    _buildAboutSection(isDesktop),

                    //* BUY PRODUCTS
                    const SizedBox(
                      height: 40,
                    ),

                    BorderBeam(
                      duration: 7, // 7-second animation cycle
                      colorFrom: Colors.blue,
                      colorTo: Colors.purple,
                      staticBorderColor: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        width: 400,
                        height: 50,
                        child: const Center(
                          child: Text(
                            'P R O D U C T S',
                            style: TextStyle(color: Colors.amber, fontSize: 40),
                          ),
                        ),
                      ),
                    )
                        .animate()
                        .scale(
                            duration: const Duration(seconds: 3),
                            curve: Curves.fastOutSlowIn)
                        .then()
                        .shimmer(
                            color: Colors.amber,
                            duration: const Duration(seconds: 4)),

                    const SizedBox(
                      height: 50,
                    ),
                    _buildProductSection(isDesktop)
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

//* PRODUCTS SECTIONS
Widget _buildProductSection(bool isDesktop) {
  return isDesktop
      ? const ProductSectionDesktop()
      : const ProductSectionMobTab();
}
