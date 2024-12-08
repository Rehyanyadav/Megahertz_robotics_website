// ignore_for_file: unused_field

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:megahertz_robotics/components/carisoule.dart';
import 'package:megahertz_robotics/components/products_cards.dart';
import 'package:megahertz_robotics/desktop/about_us_desktop.dart';
import 'package:megahertz_robotics/desktop/footer_desktop.dart';
import 'package:megahertz_robotics/mobile/footer_mobile.dart';
import '../components/cards.dart';
import '../components/custom_product_card.dart';
import '../components/drawer_mobile_tab.dart';
import '../components/member.dart';
import '../components/sections_headline_text.dart';
import '../components/youtube_thumb01.dart';
import '../constants/size.dart';
import '../desktop/navbar_desktop.dart';
import '../mobile/about_section_mobile.dart';
import '../mobile/nav_bar_mobile_tab.dart';
import 'package:meta_seo/meta_seo.dart';

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
    if (kIsWeb) {
      // Define MetaSEO object
      MetaSEO meta = MetaSEO();
      // add meta seo data for web app as you want
      meta.author(author: 'Megahertz Robotics');
      meta.description(description: 'Robotics and electronics online store');
      meta.keywords(
          keywords:
              'Flutter, Dart, SEO, Meta, Web,megaHertz Robotics,MegaHertz Robotics, MegaHertz Robotics ');
    }

    final List<Testimonial> testimonials = [
      Testimonial(
        name: 'Laganjeet jena',
        position: 'CEO, MegaHertz Robotics',
        comment:
            "At Megahertz Robotics, we're shaping the future with cutting-edge robotics and electronics innovations.",
        imageAsset: 'assets/logo.png',
        linkedinUrl: 'https://www.linkedin.com/in/johndoe/',
      ),
      Testimonial(
        name: 'Omm Sanjog Barik',
        position: 'CTO',
        comment:
            " Driving technological excellence to create robotics solutions that redefine industries.",
        imageAsset: 'assets/logo.png',
        linkedinUrl: 'https://www.linkedin.com/in/johndoe/',
      ),
      Testimonial(
        name: 'Amrutanshu Nanda',
        position: 'CFO',
        comment:
            "We strategically manage resources to fuel Megahertz Robotics' growth and innovation.",
        imageAsset: 'assets/logo.png',
        linkedinUrl: 'https://www.linkedin.com/in/johndoe/',
      ),
      Testimonial(
        name: 'Rehyan yadav',
        position: 'Tech Lead',
        comment:
            ' Owner of @alphacodes101 Building seamless digital experiences to connect our innovations with the world.',
        imageAsset: 'assets/logo.png',
        linkedinUrl: 'https://www.linkedin.com/in/rehyanyaduvanshi/',
      ),
      Testimonial(
        name: 'Sujal',
        position: 'Logistics',
        comment:
            'Ensuring efficient delivery and support for every project, every time. ',
        imageAsset: 'assets/logo.png',
        linkedinUrl: 'https://www.linkedin.com/in/johndoe/',
      ),
      Testimonial(
        name: 'Som Raj',
        position: 'Logistics',
        comment:
            " Ensuring efficient delivery and support for every project, every time.",
        imageAsset: 'assets/logo.png',
        linkedinUrl: 'https://www.linkedin.com/in/johndoe/',
      ),
      Testimonial(
        name: 'Riddhi khanna',
        position: 'Marketing ',
        comment: 'Social Media reach influencer.',
        imageAsset: 'assets/logo.png',
        linkedinUrl: 'https://www.linkedin.com/in/johndoe/',
      ),
      Testimonial(
        name: 'Aman Kumar',
        position: 'Marketing ',
        comment:
            "Together, we innovate, collaborate, and push the boundaries of robotics and technology.",
        imageAsset: 'assets/logo.png',
        linkedinUrl: 'https://www.linkedin.com/in/johndoe/',
      ),
      Testimonial(
        name: 'TANMOY DAS',
        position: 'Marketing ',
        comment:
            "Together, we innovate, collaborate, and push the boundaries of robotics and technology.",
        imageAsset: 'assets/logo.png',
        linkedinUrl: 'https://www.linkedin.com/in/johndoe/',
      ),
      Testimonial(
        name: 'Piyush Raj',
        position: 'Marketing ',
        comment:
            "Together, we innovate, collaborate, and push the boundaries of robotics and technology.",
        imageAsset: 'assets/logo.png',
        linkedinUrl: 'https://www.linkedin.com/in/johndoe/',
      ),
      Testimonial(
        name: 'Shantanu Kumar',
        position: 'Marketing ',
        comment:
            "Together, we innovate, collaborate, and push the boundaries of robotics and technology.",
        imageAsset: 'assets/logo.png',
        linkedinUrl: 'https://www.linkedin.com/in/johndoe/',
      ),
      Testimonial(
        name: 'Tushar Ojha',
        position: 'Marketing ',
        comment:
            "Together, we innovate, collaborate, and push the boundaries of robotics and technology.",
        imageAsset: 'assets/logo.png',
        linkedinUrl: 'https://www.linkedin.com/in/johndoe/',
      ),
    ];

    final List<CardItem> cardItems = [
      CardItem(
        imagePath: 'assets/logo.png',
        title: 'Serene Forest',
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Forest landscape selected!')),
          );
        },
      ),
      CardItem(
        imagePath: 'assets/logo.png',
        title: 'Majestic Mountains',
      ),
      CardItem(
        imagePath: 'assets/logo.png',
        title: 'Tropical Paradise',
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Beach landscape selected!')),
          );
        },
      ),
      CardItem(
        imagePath: 'assets/logo.png',
        title: 'Urban Skyline',
      ),
    ];

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

                    const Divider(
                      indent: 50,
                      endIndent: 50,
                      color: Colors.amber,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BorderBeam(
                      duration: 7, // 7-second animation cycle
                      colorFrom: Colors.blue,
                      colorTo: Colors.purple,
                      staticBorderColor: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                      padding: const EdgeInsets.all(16),
                      child: const SizedBox(
                        width: 600,
                        height: 40,
                        child: Center(
                          child: Text(
                            'AC H I V E M E N T S  &  P A R T I C I P A T I O N S',
                            style: TextStyle(color: Colors.amber, fontSize: 20),
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
                      height: 40,
                    ),

                    //* CARISOULE Starts here
                    ResponsiveCarousel(
                      items: [
                        Image.asset(
                            'assets/achivements_Participation_photos/image01.jpg'),
                        Image.asset(
                            'assets/achivements_Participation_photos/image02.jpg'),
                        Image.asset(
                            'assets/achivements_Participation_photos/image04.jpg'),
                        Image.asset(
                            'assets/achivements_Participation_photos/image06.jpg'),
                        Image.asset(
                            'assets/achivements_Participation_photos/image07.jpg'),
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
                      child: const SizedBox(
                        width: 300,
                        height: 40,
                        child: Center(
                          child: Text(
                            'A B O U T  U S',
                            style: TextStyle(color: Colors.amber, fontSize: 30),
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
                      height: 20,
                    ),
                    const Divider(
                      indent: 50,
                      endIndent: 50,
                      color: Colors.amber,
                    ),
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
                      child: const SizedBox(
                        width: 300,
                        height: 40,
                        child: Center(
                          child: Text(
                            'B U Y  P R O D U C T S',
                            style:
                                TextStyle(color: Colors.amber, fontSize: 30.0),
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
                      height: 20,
                    ),
                    const Divider(
                      indent: 50,
                      endIndent: 50,
                      color: Colors.amber,
                    ),
                    const SizedBox(
                      height: 50,
                    ),

                    const ProductsCards(),

                    //*   PRODUCT SECTION ENDS HERE

                    //*BUY CUSTOM  Products SECTION start here
                    const SizedBox(
                      height: 50,
                    ),
                    BorderBeam(
                      duration: 7, // 7-second animation cycle
                      colorFrom: Colors.blue,
                      colorTo: Colors.purple,
                      staticBorderColor: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                      padding: const EdgeInsets.all(16),
                      child: const SizedBox(
                        width: 300,
                        height: 40,
                        child: Center(
                          child: Text(
                            ' B U Y  C U S T O M  P R O D U C T S',
                            style: TextStyle(color: Colors.amber, fontSize: 18),
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
                      height: 20,
                    ),
                    const Divider(
                      indent: 50,
                      endIndent: 50,
                      color: Colors.amber,
                    ),

                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 69, 69, 69),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.amber, // Border color
                              width: 2, // Border width
                            ),
                          ),
                          child: const Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomProductsCards(),
                        ],
                      ),
                    ),

                    //* TUTORIALS SECTION STARTS HERE
                    const SizedBox(
                      height: 50,
                    ),
                    BorderBeam(
                      duration: 7, // 7-second animation cycle
                      colorFrom: Colors.blue,
                      colorTo: Colors.purple,
                      staticBorderColor: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                      padding: const EdgeInsets.all(16),
                      child: const SizedBox(
                        width: 200,
                        height: 40,
                        child: Center(
                          child: Text(
                            'T U T O R I A L S',
                            style: TextStyle(color: Colors.amber, fontSize: 25),
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
                      height: 30,
                    ),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ThumbnailRow(),
                        ],
                      ),
                    ),
                    //* MEMBERS

                    const SizedBox(
                      height: 50,
                    ),
                    BorderBeam(
                      duration: 7, // 7-second animation cycle
                      colorFrom: Colors.blue,
                      colorTo: Colors.purple,
                      staticBorderColor: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                      padding: const EdgeInsets.all(16),
                      child: const SizedBox(
                        width: 200,
                        height: 40,
                        child: Center(
                          child: Text(
                            'M E M B E R S',
                            style: TextStyle(color: Colors.amber, fontSize: 25),
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
                      height: 30,
                    ),
                    TestimonialCarousel(testimonials: testimonials),
                    //* MEMBErs CArisoule
                    const SizedBox(
                      height: 50,
                    ),

                    //* FEEDBACK SECTION STARTS HERE

                    const SizedBox(
                      height: 50,
                    ),
                    BorderBeam(
                      duration: 7, // 7-second animation cycle
                      colorFrom: Colors.blue,
                      colorTo: Colors.purple,
                      staticBorderColor: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                      padding: const EdgeInsets.all(16),
                      child: const SizedBox(
                        width: 200,
                        height: 40,
                        child: Center(
                          child: Text(
                            'F E E D B A C K s',
                            style: TextStyle(color: Colors.amber, fontSize: 25),
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
                    const Divider(
                      indent: 50,
                      endIndent: 50,
                      color: Colors.amber,
                    ),

                    //* FOOTER SECTION
                    _buildFooterSection(
                      isDesktop,
                    ),

                    const Text(
                      'Co.powered  and managed by Alphacodes101',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 98, 255),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    )
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

//* FOOTER SECTION

Widget _buildFooterSection(bool isDesktop) {
  return isDesktop ? const FooterDesktop() : const FooterMobile();
}
