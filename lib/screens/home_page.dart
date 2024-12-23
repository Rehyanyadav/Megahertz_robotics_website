// ignore_for_file: deprecated_member_use

import 'dart:math';

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
      'assets/achivements_Participation_photos/img01.jpg',
      'assets/achivements_Participation_photos/img02.png',
      'assets/achivements_Participation_photos/img03.png',
      'assets/achivements_Participation_photos/img04.png',
      'assets/achivements_Participation_photos/img05.jpg',
      'assets/achivements_Participation_photos/img06.jpg',
      'assets/achivements_Participation_photos/img07.png',
      'assets/achivements_Participation_photos/img08.jpg',
      'assets/achivements_Participation_photos/img09.jpg',
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
            body: AnimatedGridBackground(
              primaryColor: const Color.fromARGB(255, 0, 55, 255),
              secondaryColor:
                  const Color.fromARGB(255, 0, 242, 255).withOpacity(0.5),
              gridSpacing: 40,
              animationSpeed: 1,
              gridStyle: GridStyle.circuit,
              child: ListView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                children: [
                  _buildNavbar(isDesktop),
                  const DividerWidget(),
                  const SizedBox(height: 40),
                  _buildHeader(
                      'A C H I E V E M E N T S  &\nP A R T I C I P A T I O N S'),
                  const SizedBox(height: 40),
                  _buildCarousel(),
                  const SizedBox(height: 40),
                  const DividerWidget(),
                  const SizedBox(height: 40),
                  _buildHeader('O U R  J O U R N E Y'),
                  const SizedBox(height: 20),
                  _buildAboutSection(isDesktop),
                  const DividerWidget(),
                  const SizedBox(height: 50),
                  _buildHeader('B U Y  P R O D U C T S'),
                  const SizedBox(height: 50),
                  const ProductsCards(),
                  const SizedBox(height: 50),
                  const DividerWidget(),
                  const SizedBox(height: 50),
                  _buildHeader('B U Y  C U S T O M\nP R O D U C T S'),
                  const SizedBox(height: 50),
                  const CustomProductsCards(),
                  const SizedBox(height: 50),
                  const DividerWidget(),
                  const SizedBox(height: 50),
                  _buildHeader('T U T O R I A L S'),
                  const SizedBox(height: 50),
                  const ThumbnailRow(),
                  const SizedBox(height: 50),
                  const DividerWidget(),
                  const SizedBox(height: 50),
                  _buildHeader('M E M B E R S'),
                  const SizedBox(height: 50),
                  TestimonialCarousel(testimonials: testimonials),
                  const SizedBox(height: 50),
                  const DividerWidget(),
                  const SizedBox(height: 50),
                  _buildHeader('F E E D B A C K S'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.start, // Align cards at the start
                      children: feedbackList
                          .map((feedback) => FeedbackCard(feedback: feedback))
                          .toList(),
                    ),
                  ),
                  const DividerWidget(),
                  _buildFooterSection(isDesktop),
                  _buildCoPoweredSection(),
                ],
              ),
            ));
      },
    );
  }

  Widget _buildCarousel() {
    return const ResponsiveCarousel(
      imagePaths: [
        'assets/achivements_Participation_photos/img01.jpg',
        'assets/achivements_Participation_photos/img02.png',
        'assets/achivements_Participation_photos/img03.png',
        'assets/achivements_Participation_photos/img04.png',
        'assets/achivements_Participation_photos/img05.jpg',
        'assets/achivements_Participation_photos/img06.jpg',
        'assets/achivements_Participation_photos/img07.jpg',
        'assets/achivements_Participation_photos/img08.jpg',
        'assets/achivements_Participation_photos/img09.jpg',
      ],
    );
  }

  // Lazy-loaded image with a placeholder

  Widget _buildHeader(String title) {
    return Container(
      alignment: Alignment.center,
      child: BorderBeam(
        height: 60,
        width: 300,
        duration: 2,
        borderWidth: 1,
        colorFrom: Colors.blue,
        colorTo: Colors.purple,
        staticBorderColor: Colors.black,
        borderRadius: BorderRadius.circular(10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontStyle: GoogleFonts.oswald().fontStyle,
            color: Colors.amber,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ).animate().then().shimmer(
          duration: const Duration(milliseconds: 2000), color: Colors.amber),
    );
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
            'A L P H A  C O D E S',
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

//* feedback cardimport 'package:flutter/material.dart';

// Feedback Model
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

// FeedbackCard Widget
class FeedbackCard extends StatelessWidget {
  final Feedback feedback;

  const FeedbackCard({super.key, required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Container(
        width:
            280, // Fixed width for each card to keep them aligned horizontally
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 12),

            // User Name
            Text(
              feedback.userName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Comment
            Text(
              feedback.comment,
              style: const TextStyle(fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),

            // Date
            Text(
              '${feedback.date.day}/${feedback.date.month}/${feedback.date.year}',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 8),

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

//* ANIMATED BACKGROUND

class AnimatedGridBackground extends StatefulWidget {
  final Widget child;
  final Color primaryColor;
  final Color secondaryColor;
  final double gridSpacing;
  final double animationSpeed;
  final GridStyle gridStyle;

  const AnimatedGridBackground({
    super.key,
    required this.child,
    this.primaryColor = const Color(0xFF2196F3),
    this.secondaryColor = const Color(0xFF9C27B0),
    this.gridSpacing = 30,
    this.animationSpeed = 1.0,
    this.gridStyle = GridStyle.waves,
  });

  @override
  State<AnimatedGridBackground> createState() => _AnimatedGridBackgroundState();
}

enum GridStyle { waves, matrix, hexagonal, circuit }

class _AnimatedGridBackgroundState extends State<AnimatedGridBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: (3 / widget.animationSpeed).round()),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: switch (widget.gridStyle) {
                GridStyle.waves => WaveGridPainter(
                    animation: _controller,
                    primaryColor: widget.primaryColor,
                    secondaryColor: widget.secondaryColor,
                    gridSpacing: widget.gridSpacing,
                  ),
                GridStyle.matrix => MatrixGridPainter(
                    animation: _controller,
                    primaryColor: widget.primaryColor,
                    secondaryColor: widget.secondaryColor,
                    gridSpacing: widget.gridSpacing,
                  ),
                GridStyle.hexagonal => HexagonalGridPainter(
                    animation: _controller,
                    primaryColor: widget.primaryColor,
                    secondaryColor: widget.secondaryColor,
                    gridSpacing: widget.gridSpacing,
                  ),
                GridStyle.circuit => CircuitGridPainter(
                    animation: _controller,
                    primaryColor: widget.primaryColor,
                    secondaryColor: widget.secondaryColor,
                    gridSpacing: widget.gridSpacing,
                  ),
              },
              child: Container(),
            );
          },
        ),
        widget.child,
      ],
    );
  }
}

class WaveGridPainter extends CustomPainter {
  final Animation<double> animation;
  final Color primaryColor;
  final Color secondaryColor;
  final double gridSpacing;

  WaveGridPainter({
    required this.animation,
    required this.primaryColor,
    required this.secondaryColor,
    required this.gridSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..strokeWidth = 1.0;
    final horizontalLines = (size.height / gridSpacing).ceil() + 1;
    final verticalLines = (size.width / gridSpacing).ceil() + 1;

    for (var i = 0; i < horizontalLines; i++) {
      for (var j = 0; j < verticalLines; j++) {
        final x = j * gridSpacing;
        final waveOffset = sin(animation.value * 2 * pi + i * 0.3) * 20;
        final y = i * gridSpacing + waveOffset;

        final colorProgress =
            (sin(animation.value * pi + (x + y) / 200) + 1) / 2;
        final color = Color.lerp(primaryColor, secondaryColor, colorProgress)!;

        final particleGlow = Paint()
          ..shader = RadialGradient(
            colors: [
              color.withOpacity(0.6),
              color.withOpacity(0.3),
              color.withOpacity(0.0),
            ],
          ).createShader(Rect.fromCircle(
            center: Offset(x, y),
            radius: 8,
          ));

        canvas.drawCircle(Offset(x, y), 8, particleGlow);
        canvas.drawCircle(
          Offset(x, y),
          2 + sin(animation.value * 4 * pi + x / 50) * 1,
          paint..color = color.withOpacity(0.8),
        );

        if (j > 0) {
          final prevX = x - gridSpacing;
          final prevY = i * gridSpacing +
              sin(animation.value * 2 * pi + (i - 1) * 0.3) * 20;

          final distance = sqrt(pow(x - prevX, 2) + pow(y - prevY, 2));
          final maxDistance = gridSpacing * 1.5;

          if (distance < maxDistance) {
            final gradient = LinearGradient(
              colors: [
                color.withOpacity(0.4 * (1 - distance / maxDistance)),
                color.withOpacity(0.1 * (1 - distance / maxDistance)),
              ],
            ).createShader(Rect.fromPoints(
              Offset(prevX, prevY),
              Offset(x, y),
            ));

            canvas.drawLine(
              Offset(prevX, prevY),
              Offset(x, y),
              paint
                ..shader = gradient
                ..strokeWidth = 1.5 * (1 - distance / maxDistance),
            );
          }
        }

        if (i > 0) {
          final upX = x;
          final upY = (i - 1) * gridSpacing +
              sin(animation.value * 2 * pi + (i - 1) * 0.3) * 20;

          final distance = sqrt(pow(x - upX, 2) + pow(y - upY, 2));
          final maxDistance = gridSpacing * 1.5;

          if (distance < maxDistance) {
            final gradient = LinearGradient(
              colors: [
                color.withOpacity(0.3 * (1 - distance / maxDistance)),
                color.withOpacity(0.1 * (1 - distance / maxDistance)),
              ],
            ).createShader(Rect.fromPoints(
              Offset(upX, upY),
              Offset(x, y),
            ));

            canvas.drawLine(
              Offset(upX, upY),
              Offset(x, y),
              paint
                ..shader = gradient
                ..strokeWidth = 1.5 * (1 - distance / maxDistance),
            );
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(WaveGridPainter oldDelegate) => true;
}

// class ModernWaveGridPainter extends CustomPainter {
//   final Animation<double> animation;
//   final Color primaryColor;
//   final Color secondaryColor;
//   final double gridSpacing;

//   ModernWaveGridPainter({
//     required this.animation,
//     required this.primaryColor,
//     required this.secondaryColor,
//     required this.gridSpacing,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..strokeWidth = 1.0;
//     final horizontalLines = (size.height / gridSpacing).ceil() + 1;
//     final verticalLines = (size.width / gridSpacing).ceil() + 1;

//     // Create particle effect with dynamic connections
//     for (var i = 0; i < horizontalLines; i++) {
//       for (var j = 0; j < verticalLines; j++) {
//         final x = j * gridSpacing;
//         // Create multiple wave layers for depth
//         final waveOffset1 = sin(animation.value * 2 * pi + i * 0.3) * 20;
//         final waveOffset2 = cos(animation.value * 1.5 * pi + j * 0.4) * 15;
//         final waveOffset = waveOffset1 + waveOffset2;

//         final y = i * gridSpacing + waveOffset;

//         // Create dynamic color gradient
//         final colorProgress =
//             (sin(animation.value * pi + (x + y) / 200) + 1) / 2;
//         final color = Color.lerp(
//           primaryColor,
//           secondaryColor,
//           colorProgress,
//         )!;

//         // Draw glowing particles
//         final particleGlow = Paint()
//           ..shader = RadialGradient(
//             colors: [
//               color.withOpacity(0.6),
//               color.withOpacity(0.3),
//               color.withOpacity(0.0),
//             ],
//           ).createShader(Rect.fromCircle(
//             center: Offset(x, y),
//             radius: 8,
//           ));

//         canvas.drawCircle(Offset(x, y), 8, particleGlow);
//         canvas.drawCircle(
//           Offset(x, y),
//           2 + sin(animation.value * 4 * pi + x / 50) * 1,
//           paint..color = color.withOpacity(0.8),
//         );

//         // Draw dynamic connections
//         if (j > 0) {
//           final prevX = x - gridSpacing;
//           final prevY = i * gridSpacing +
//               sin(animation.value * 2 * pi + (i - 1) * 0.3) * 20 +
//               cos(animation.value * 1.5 * pi + (j - 1) * 0.4) * 15;

//           final distance = sqrt(pow(x - prevX, 2) + pow(y - prevY, 2));
//           final maxDistance = gridSpacing * 1.5;

//           if (distance < maxDistance) {
//             final gradient = LinearGradient(
//               colors: [
//                 color.withOpacity(0.4 * (1 - distance / maxDistance)),
//                 color.withOpacity(0.1 * (1 - distance / maxDistance)),
//               ],
//             ).createShader(Rect.fromPoints(
//               Offset(prevX, prevY),
//               Offset(x, y),
//             ));

//             canvas.drawLine(
//               Offset(prevX, prevY),
//               Offset(x, y),
//               paint
//                 ..shader = gradient
//                 ..strokeWidth = 1.5 * (1 - distance / maxDistance),
//             );
//           }
//         }

//         // Draw vertical connections
//         if (i > 0) {
//           final upX = x;
//           final upY = (i - 1) * gridSpacing +
//               sin(animation.value * 2 * pi + (i - 1) * 0.3) * 20 +
//               cos(animation.value * 1.5 * pi + j * 0.4) * 15;

//           final distance = sqrt(pow(x - upX, 2) + pow(y - upY, 2));
//           final maxDistance = gridSpacing * 1.5;

//           if (distance < maxDistance) {
//             final gradient = LinearGradient(
//               colors: [
//                 color.withOpacity(0.3 * (1 - distance / maxDistance)),
//                 color.withOpacity(0.1 * (1 - distance / maxDistance)),
//               ],
//             ).createShader(Rect.fromPoints(
//               Offset(upX, upY),
//               Offset(x, y),
//             ));

//             canvas.drawLine(
//               Offset(upX, upY),
//               Offset(x, y),
//               paint
//                 ..shader = gradient
//                 ..strokeWidth = 1.5 * (1 - distance / maxDistance),
//             );
//           }
//         }
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(ModernWaveGridPainter oldDelegate) => true;
// }

class MatrixGridPainter extends CustomPainter {
  final Animation<double> animation;
  final Color primaryColor;
  final Color secondaryColor;
  final double gridSpacing;

  MatrixGridPainter({
    required this.animation,
    required this.primaryColor,
    required this.secondaryColor,
    required this.gridSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..strokeWidth = 1.5;
    final random = Random(42);

    for (var i = 0; i < size.width / gridSpacing; i++) {
      for (var j = 0; j < size.height / gridSpacing; j++) {
        final x = i * gridSpacing;
        final y = (j * gridSpacing + animation.value * 100) % size.height;

        if (random.nextDouble() > 0.7) {
          paint.color = Color.lerp(
            primaryColor,
            secondaryColor,
            random.nextDouble(),
          )!
              .withOpacity(0.6);

          canvas.drawText(
            ['0', '1'][random.nextInt(2)],
            Offset(x, y),
            paint,
            size.width,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(MatrixGridPainter oldDelegate) => true;
}

class HexagonalGridPainter extends CustomPainter {
  final Animation<double> animation;
  final Color primaryColor;
  final Color secondaryColor;
  final double gridSpacing;

  HexagonalGridPainter({
    required this.animation,
    required this.primaryColor,
    required this.secondaryColor,
    required this.gridSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final hexRadius = gridSpacing / 2;
    final horizontalSpacing = hexRadius * sqrt(3);
    final verticalSpacing = hexRadius * 1.5;

    for (var i = -1; i < size.width / horizontalSpacing + 1; i++) {
      for (var j = -1; j < size.height / verticalSpacing + 1; j++) {
        final x = i * horizontalSpacing + (j % 2) * horizontalSpacing / 2;
        final y = j * verticalSpacing;

        final progress = (animation.value + (x + y) / 500) % 1.0;
        paint.color = Color.lerp(
          primaryColor,
          secondaryColor,
          progress,
        )!
            .withOpacity(0.3);

        drawHexagon(canvas, x, y,
            hexRadius * (0.8 + 0.2 * sin(progress * 2 * pi)), paint);
      }
    }
  }

  void drawHexagon(
      Canvas canvas, double x, double y, double radius, Paint paint) {
    final path = Path();
    for (var i = 0; i < 6; i++) {
      final angle = i * pi / 3;
      final px = x + radius * cos(angle);
      final py = y + radius * sin(angle);
      if (i == 0) {
        path.moveTo(px, py);
      } else {
        path.lineTo(px, py);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(HexagonalGridPainter oldDelegate) => true;
}

class CircuitGridPainter extends CustomPainter {
  final Animation<double> animation;
  final Color primaryColor;
  final Color secondaryColor;
  final double gridSpacing;

  CircuitGridPainter({
    required this.animation,
    required this.primaryColor,
    required this.secondaryColor,
    required this.gridSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final random = Random(42);
    final nodes = <Offset>[];

    // Create circuit nodes
    for (var i = 0; i < size.width / gridSpacing; i++) {
      for (var j = 0; j < size.height / gridSpacing; j++) {
        if (random.nextDouble() > 0.7) {
          nodes.add(Offset(i * gridSpacing, j * gridSpacing));
        }
      }
    }

    // Draw connections and nodes
    for (var i = 0; i < nodes.length; i++) {
      for (var j = i + 1; j < nodes.length; j++) {
        final dist = (nodes[i] - nodes[j]).distance;
        if (dist < gridSpacing * 2) {
          final wave = sin(animation.value * 2 * pi + dist / gridSpacing);
          final progress = (animation.value + dist / 500) % 1.0;
          paint.color = Color.lerp(
            primaryColor,
            secondaryColor,
            (wave + 1) / 2,
          )!
              .withOpacity(0.3 + 0.2 * wave.abs());

          final path = Path()
            ..moveTo(nodes[i].dx, nodes[i].dy)
            ..lineTo(nodes[j].dx, nodes[j].dy);

          canvas.drawPath(path, paint);

          // Draw pulsing node
          paint.style = PaintingStyle.fill;
          final pulseRadius =
              2 + sin((animation.value + dist / 200) * 2 * pi) * 1.5;
          canvas.drawCircle(
            nodes[i],
            pulseRadius,
            paint..color = paint.color.withOpacity(0.6),
          );
          paint.style = PaintingStyle.stroke;
        }
      }
    }
  }

  @override
  bool shouldRepaint(CircuitGridPainter oldDelegate) => true;
}

extension CanvasText on Canvas {
  void drawText(String text, Offset position, Paint paint, double maxWidth) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: paint.color,
          fontSize: 20,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(maxWidth: maxWidth);
    textPainter.paint(this, position);
  }
}
