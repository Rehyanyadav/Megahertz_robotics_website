import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/custom_product_card.dart';
import '../widgets/member.dart';
import '../widgets/products_cards.dart';
import '../widgets/youtube_thumb01.dart';
import '../constants/size.dart';
import '../widgets/navbar_desktop.dart';
import '../widgets/about_section_mobile.dart';
import '../widgets/nav_bar_mobile_tab.dart';
import 'package:meta_seo/meta_seo.dart';
import '../model/testimonial.dart';
import '../model/timeline_event.dart';
import '../widgets/animated_header.dart';
import '../widgets/carisoule_achivement.dart';
import '../widgets/drawer_mobile_tab.dart';
import '../widgets/footer_desktop.dart';
import '../widgets/footer_mobile.dart';

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
      'assets/achivements_Participation_photos/img01.png',
      'assets/achivements_Participation_photos/img02.png',
      'assets/achivements_Participation_photos/img04.png',
      'assets/achivements_Participation_photos/img06.png',
      'assets/achivements_Participation_photos/img07.png',
    ];

    for (var path in imagePaths) {
      precacheImage(AssetImage(path), context);
    }
  }

  final List<Feedback> feedbackList = [
    Feedback(
      userName: 'Prateek Priyanshu',
      comment: 'Excellent delivery and service.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 22:52:33'),
    ),
    Feedback(
      userName: 'Naiza Fatma',
      comment: 'Nice.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 22:53:25'),
    ),
    Feedback(
      userName: 'S.Pradhan',
      comment: 'The product was good up to the mark.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 22:54:23'),
    ),
    // Add more Feedback objects as needed
  ];

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
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: feedbackList.length,
                itemBuilder: (context, index) {
                  return FeedbackCard(feedback: feedbackList[index]);
                },
              ),
              const DividerWidget(),
              _buildFooterSection(isDesktop),
              _buildCoPoweredSection(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCarousel() {
    return const ResponsiveCarousel(
      imagePaths: [
        'assets/achivements_Participation_photos/img01.png',
        'assets/achivements_Participation_photos/img02.png',
        'assets/achivements_Participation_photos/img04.png',
      ],
    );
  }

  // Lazy-loaded image with a placeholder

  Widget _buildHeader(String title) {
    return BorderBeam(
      duration: 2,
      borderWidth: 2,
      colorFrom: Colors.blue,
      colorTo: Colors.purple,
      staticBorderColor: Colors.black,
      borderRadius: BorderRadius.circular(10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontStyle: GoogleFonts.dmSerifDisplay().fontStyle,
          color: Colors.amber,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ).animate().then().shimmer(
        duration: const Duration(milliseconds: 2000), color: Colors.amber);
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
              fontSize: 16.0,
              fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () async {
            final Uri url = Uri.parse(
                'https://alphacodes101.github.io/alphacodes.github.io/');
            try {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            } catch (e) {
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Could not launch $url')),
              );
            }
          },
          child: const Text(
            'Alphacodes101',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 174, 255),
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

// Optimized Animated Header Widget

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

//* feedback card
class Feedback {
  final String userName;
  final String comment;
  final double rating;
  final DateTime date;

  Feedback({
    required this.userName,
    required this.comment,
    required this.rating,
    required this.date,
  });
}

class FeedbackCard extends StatelessWidget {
  final Feedback feedback;

  const FeedbackCard({super.key, required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar or User Initial
            CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: 24,
              child: Text(
                feedback.userName[0],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(width: 12),

            // Expanded column for user details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // User Name
                  Text(
                    feedback.userName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Comment
                  Text(
                    feedback.comment,
                    style: const TextStyle(fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),

                  // Date
                  Text(
                    '${feedback.date.day}/${feedback.date.month}/${feedback.date.year}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // Rating
            RatingBarIndicator(
              rating: feedback.rating,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}

class FeedbackList extends StatelessWidget {
  final List<Feedback> feedbackList = [
    Feedback(
      userName: 'Prateek Priyanshu',
      comment: 'Excellent delivery and service.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 22:52:33'),
    ),
    Feedback(
      userName: 'Naiza Fatma',
      comment: 'Nice.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 22:53:25'),
    ),
    Feedback(
      userName: 'S.Pradhan',
      comment: 'The product was good up to the mark.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 22:54:23'),
    ),
    Feedback(
      userName: 'Awi Kumari',
      comment:
          'Service is appreciatable, got quick response. The products are amazing and of great quality.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 22:55:33'),
    ),
    Feedback(
      userName: 'AKARSH RAJ',
      comment: 'Awesome.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 22:57:39'),
    ),
    Feedback(
      userName: 'Satyaki Seth',
      comment: 'Good.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 22:57:49'),
    ),
    Feedback(
      userName: 'Bhavya Mishra',
      comment: 'Great service, products are of high quality.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 23:04:33'),
    ),
    Feedback(
      userName: 'Anish R',
      comment: 'All the products are awesome 😎.',
      rating: 5.0,
      date: DateTime.parse('2024-12-08 23:14:06'),
    ),
    Feedback(
      userName: 'RIDDHI KHANNA',
      comment: 'The customer service is amazing, and delivery is hassle-free!',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 00:07:09'),
    ),
    Feedback(
      userName: 'Adya Mishra',
      comment:
          'The product in question is exactly as advertised and is really worth the money.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 00:08:08'),
    ),
    Feedback(
      userName: 'Shruti Roy',
      comment: 'The product quality is consistently outstanding.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 00:09:14'),
    ),
    Feedback(
      userName: 'Aman Shekhar',
      comment: 'The product quality is exceeding my expectations every time.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 00:10:00'),
    ),
    Feedback(
      userName: 'Aditya Kumar',
      comment:
          'Had an amazing experience and the product was exactly what I was looking for.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 00:11:04'),
    ),
    Feedback(
      userName: 'Divya Sinha',
      comment: 'Products are great and services are also good.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 01:16:58'),
    ),
    Feedback(
      userName: 'Ankit Singh',
      comment: 'Products are great and services are also good.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 01:33:53'),
    ),
    Feedback(
      userName: 'Shreya Suman',
      comment: 'Feedback is very good.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 01:41:44'),
    ),
    Feedback(
      userName: 'Bristy Roy',
      comment: 'Products and services are really good.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 02:00:22'),
    ),
    Feedback(
      userName: 'Hardik Prasad',
      comment: 'Service is really good and have great products.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 09:12:26'),
    ),
    Feedback(
      userName: 'Gaurav Bhulania',
      comment: 'Service is really good and have great products.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 09:59:30'),
    ),
    Feedback(
      userName: 'Ashish Kumar',
      comment: 'Service is very good and have great products.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 12:55:47'),
    ),
    Feedback(
      userName: 'Rupali',
      comment: 'Service is great and have nice products.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 13:02:04'),
    ),
    Feedback(
      userName: 'Abhinav Kr',
      comment: 'Service is nice and have great products.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 13:02:23'),
    ),
    Feedback(
      userName: 'Palak Sinha',
      comment: 'Service is very good and have nice products.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 13:02:37'),
    ),
    Feedback(
      userName: 'Golu Kumar',
      comment: 'The service and product was too good.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 20:56:15'),
    ),
    Feedback(
      userName: 'Rahul Kumar',
      comment: 'Both were too good.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 20:57:01'),
    ),
    Feedback(
      userName: 'Muskan Bharti',
      comment: 'Very nice service.',
      rating: 5.0,
      date: DateTime.parse('2024-12-09 20:57:56'),
    ),
  ];

  FeedbackList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align cards to the top
          children: feedbackList
              .map((feedback) => FeedbackCard(feedback: feedback))
              .toList(),
        ),
      ),
    );
  }
}

final List<Feedback> feedbackList = [
  Feedback(
    userName: 'Prateek Priyanshu',
    comment: 'Excellent delivery and service.',
    rating: 5.0,
    date: DateTime.parse('2024-12-08 22:52:33'),
  ),
  Feedback(
    userName: 'Naiza Fatma',
    comment: 'Nice.',
    rating: 5.0,
    date: DateTime.parse('2024-12-08 22:53:25'),
  ),
  Feedback(
    userName: 'S.Pradhan',
    comment: 'The product was good up to the mark.',
    rating: 5.0,
    date: DateTime.parse('2024-12-08 22:54:23'),
  ),
  Feedback(
    userName: 'Awi Kumari',
    comment:
        'Service is appreciatable, got quick response. The products are amazing and of great quality.',
    rating: 5.0,
    date: DateTime.parse('2024-12-08 22:55:33'),
  ),
  Feedback(
    userName: 'AKARSH RAJ',
    comment: 'Awesome.',
    rating: 5.0,
    date: DateTime.parse('2024-12-08 22:57:39'),
  ),
  Feedback(
    userName: 'Satyaki Seth',
    comment: 'Good.',
    rating: 5.0,
    date: DateTime.parse('2024-12-08 22:57:49'),
  ),
  Feedback(
    userName: 'Bhavya Mishra',
    comment: 'Great service, products are of high quality.',
    rating: 5.0,
    date: DateTime.parse('2024-12-08 23:04:33'),
  ),
  Feedback(
    userName: 'Anish R',
    comment: 'All the products are awesome 😎.',
    rating: 5.0,
    date: DateTime.parse('2024-12-08 23:14:06'),
  ),
  Feedback(
    userName: 'RIDDHI KHANNA',
    comment: 'The customer service is amazing, and delivery is hassle-free!',
    rating: 5.0,
    date: DateTime.parse('2024-12-09 00:07:09'),
  ),
  Feedback(
    userName: 'Adya Mishra',
    comment:
        'The product in question is exactly as advertised and is really worth the money.',
    rating: 5.0,
    date: DateTime.parse('2024-12-09 00:08:08'),
  ),
  Feedback(
    userName: 'Shruti Roy',
    comment: 'The product quality is consistently outstanding.',
    rating: 5.0,
    date: DateTime.parse('2024-12-09 00:09:14'),
  ),
  Feedback(
    userName: 'Aman Shekhar',
    comment: 'The product quality is exceeding my expectations every time.',
    rating: 5.0,
    date: DateTime.parse('2024-12-09 00:10:00'),
  ),
  Feedback(
    userName: 'Aditya Kumar',
    comment:
        'Had an amazing experience and the product was exactly what I was looking for.',
    rating: 5.0,
    date: DateTime.parse('2024-12-09 00:11:04'),
  ),
  Feedback(
    userName: 'Divya Sinha',
    comment: 'Products are great and services are also good.',
    rating: 5.0,
    date: DateTime.parse('2024-12-09 01:16:58'),
  ),
  Feedback(
    userName: 'Ankit Singh',
    comment: 'Products are great and services are also good.',
    rating: 5.0,
    date: DateTime.parse('2024-12-09 01:33:53'),
  ),
  Feedback(
    userName: 'Shreya Suman',
    comment: 'Feedback is very good.',
    rating: 5.0,
    date: DateTime.parse('2024-12-09 01:41:44'),
  ),
  Feedback(
    userName: 'Bristy Roy',
    comment: 'Products and services are really good.',
    rating: 5.0,
    date: DateTime.parse('2024-12-09 02:00:22'),
  ),
  Feedback(
    userName: 'Hardik Prasad',
    comment: 'Service is really good and have great products.',
    rating: 5.0,
    date: DateTime.parse('2024-12-09 09:12:26'),
  ),
  Feedback(
    userName: 'Gaurav Bhulania',
    comment: 'Service is really good and have great products.',
    rating: 5.0,
    date: DateTime.parse('2024-12-09 09:59:30'),
  ),
  Feedback(
    userName: 'Ashish Kumar',
    comment: 'Service is very good and have great products.',
    rating: 5.0,
    date: DateTime.parse('2024-12-09 12:55:47'),
  ),
  Feedback(
    userName: 'Rupali',
    comment: 'Service is great and have nice products.',
    rating: 5.0,
    date: DateTime.parse('2024-12-09 13:02:04'),
  ),
  Feedback(
    userName: 'Abhinav Kr',
    comment: 'Service is nice and have great products.',
    rating: 5.0,
    date: DateTime.parse('2024-12-09 13:02:23'),
  ),
  Feedback(
    userName: 'Palak Sinha',
    comment: 'Service is very good and have nice products.',
    rating: 5.0,
    date: DateTime.parse('2024-12-09 13:02:37'),
  ),
  Feedback(
    userName: 'Golu Kumar',
    comment: 'The service and product was too good.',
    rating: 5.0,
    date: DateTime.parse('2024-12-09 20:56:15'),
  ),
  Feedback(
    userName: 'Rahul Kumar',
    comment: 'Both were too good.',
    rating: 5.0,
    date: DateTime.parse('2024-12-09 20:57:01'),
  ),
  Feedback(
    userName: 'Muskan Bharti',
    comment: 'Very nice service.',
    rating: 5.0,
    date: DateTime.parse('2024-12-09 20:57:56'),
  ),
];
