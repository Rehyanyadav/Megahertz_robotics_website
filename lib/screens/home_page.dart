import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/carisoule.dart';
import '../components/custom_product_card.dart';
import '../components/drawer_mobile_tab.dart';
import '../components/member.dart';
import '../components/products_cards.dart';
import '../components/sections_headline_text.dart';
import '../components/youtube_thumb01.dart';
import '../constants/size.dart';
import '../desktop/footer_desktop.dart';
import '../desktop/navbar_desktop.dart';
import '../mobile/about_section_mobile.dart';
import '../mobile/footer_mobile.dart';
import '../mobile/nav_bar_mobile_tab.dart';
import 'package:meta_seo/meta_seo.dart';

import '../model/testimonial.dart';
import '../model/timeline_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    // Precache images to improve performance
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _precacheImages();
    });
  }

  void _precacheImages() {
    final imagePaths = [
      'assets/achivements_Participation_photos/image01.jpg',
      'assets/achivements_Participation_photos/image02.jpg',
      'assets/achivements_Participation_photos/image04.jpg',
      'assets/achivements_Participation_photos/image06.jpg',
      'assets/achivements_Participation_photos/image07.jpg',
    ];

    for (var path in imagePaths) {
      precacheImage(AssetImage(path), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (kIsWeb) {
      MetaSEO meta = MetaSEO();
      meta.author(author: 'Megahertz Robotics');
      meta.description(description: 'Robotics and electronics online store');
      meta.keywords(
        keywords: 'Flutter, Dart, SEO, Meta, Web, MegaHertz Robotics',
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= KMinDesktopWidth;
        return Scaffold(
          backgroundColor: Colors.black,
          key: _scaffoldKey,
          endDrawer: isDesktop ? null : const DrawerMobileTab(),
          body: ListView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            children: [
              _buildNavbar(isDesktop),
              const DividerWidget(),
              const SizedBox(height: 20),
              _buildHeader(
                  'A C H I E V E M E N T S  &\nP A R T I C I P A T I O N S'),
              const SizedBox(height: 40),
              _buildCarousel(),
              const SizedBox(height: 20),
              const DividerWidget(),
              const SizedBox(height: 20),
              _buildHeader('O U R  J O U R N E Y'),
              const SizedBox(height: 20),
              _buildAboutSection(isDesktop),
              const DividerWidget(),
              const SizedBox(height: 20),
              _buildHeader('B U Y  P R O D U C T S'),
              const SizedBox(height: 20),
              const ProductsCards(),
              const SizedBox(height: 20),
              const DividerWidget(),
              const SizedBox(height: 20),
              _buildHeader('B U Y  C U S T O M\nP R O D U C T S'),
              const SizedBox(height: 20),
              const CustomProductsCards(),
              const SizedBox(height: 20),
              const DividerWidget(),
              const SizedBox(height: 20),
              _buildHeader('T U T O R I A L S'),
              const SizedBox(height: 20),
              const ThumbnailRow(),
              const SizedBox(height: 20),
              const DividerWidget(),
              const SizedBox(height: 20),
              _buildHeader('M E M B E R S'),
              const SizedBox(height: 20),
              TestimonialCarousel(testimonials: testimonials),
              const SizedBox(height: 20),
              const DividerWidget(),
              const SizedBox(height: 20),
              _buildHeader('F E E D B A C K S'),
              _buildFooterSection(isDesktop),
              _buildCoPoweredSection(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCarousel() {
    return ResponsiveCarousel(
      items: [
        _optimizedImage('assets/achivements_Participation_photos/img01.png'),
        _optimizedImage('assets/achivements_Participation_photos/img02.png'),
        _optimizedImage('assets/achivements_Participation_photos/img04.png'),
      ],
    );
  }

  // Lazy-loaded image with a placeholder
  Widget _optimizedImage(String path) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/placeholder.png',
      image: path,
      fit: BoxFit.cover,
      width: 400,
      height: 300,
    );
  }

  Widget _buildHeader(String title) {
    return kIsWeb
        ? Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.amber,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        : OptimizedAnimatedHeader(title: title);
  }

  Widget _buildNavbar(bool isDesktop) {
    return isDesktop
        ? const NavbarDesktop()
        : NavbarMobileTab(
            onmenuTap: () => _scaffoldKey.currentState?.openEndDrawer());
  }

  Widget _buildAboutSection(bool isDesktop) {
    return CarouselTimeline(events: timelineEvents);
  }

  Widget _buildFooterSection(bool isDesktop) {
    return isDesktop ? const FooterDesktop() : const FooterMobile();
  }

  Widget _buildCoPoweredSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Co.powered and managed by :',
          style: TextStyle(
              color: Color.fromARGB(255, 0, 174, 255),
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () async {
            final Uri url = Uri.parse(
                'https://alphacodes101.github.io/alphacodes.github.io/');
            try {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Could not launch $url')),
              );
            }
          },
          child: const Text(
            'Alphacodes101',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 174, 255),
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

// Optimized Animated Header Widget
class OptimizedAnimatedHeader extends StatelessWidget {
  final String title;
  const OptimizedAnimatedHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.amber,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    )
        .animate(
          onPlay: (controller) => controller.repeat(reverse: true),
        )
        .scale(
          duration: const Duration(milliseconds: 500),
          begin: const Offset(0.9, 0.9),
          end: const Offset(1.1, 1.1),
        )
        .then()
        .shimmer(
          color: Colors.amber,
          duration: const Duration(milliseconds: 800),
        );
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: 50,
      endIndent: 50,
      color: Colors.amber,
      thickness: 1.5,
    );
  }
}
