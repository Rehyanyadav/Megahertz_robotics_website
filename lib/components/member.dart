import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:social_media_buttons/social_media_buttons.dart';

// Testimonial data model
class Testimonial {
  final String name;
  final String position;
  final String comment;
  final String imageAsset;
  final String linkedinUrl;

  Testimonial({
    required this.name,
    required this.position,
    required this.comment,
    required this.imageAsset,
    required this.linkedinUrl,
  });
}

class TestimonialCarousel extends StatefulWidget {
  final List<Testimonial> testimonials;

  const TestimonialCarousel({
    super.key,
    required this.testimonials,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TestimonialCarouselState createState() => _TestimonialCarouselState();
}

class _TestimonialCarouselState extends State<TestimonialCarousel> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: widget.testimonials.length,
          itemBuilder: (context, index, realIndex) {
            final testimonial = widget.testimonials[index];
            return _buildTestimonialCard(testimonial, index);
          },
          options: CarouselOptions(
            height: 450,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.easeInOutQuart,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.85,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        const SizedBox(height: 20),
        // Innovative Carousel Indicator
        _buildCarouselIndicator(),
      ],
    );
  }

  Widget _buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.testimonials.asMap().entries.map((entry) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: _current == entry.key ? 35 : 12,
          height: 12,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _current == entry.key
                ? const Color.fromARGB(255, 183, 146, 58)
                : const Color.fromARGB(255, 255, 221, 0).withOpacity(0.3),
          ),
        );
      }).toList(),
    );
  }

//   Widget _buildTestimonialCard(Testimonial testimonial, int index) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Colors.white,
//             const Color.fromARGB(255, 255, 196, 0).withOpacity(0.1),
//           ],
//         ),
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: const Color.fromARGB(255, 255, 208, 0).withOpacity(0.2),
//             spreadRadius: 3,
//             blurRadius: 10,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Stack(
//         children: [
//           // Background Wave Design
//           Positioned(
//             top: -50,
//             right: -50,
//             child: Opacity(
//               opacity: 0.2,
//               child: Transform.rotate(
//                 angle: 0.5,
//                 child: Container(
//                   width: 200,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     color: Colors.deepPurple.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(100),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Profile Image with Unique Border
//                 Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                       color:
//                           const Color.fromARGB(255, 5, 5, 5).withOpacity(0.5),
//                       width: 4,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color:
//                             const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
//                         blurRadius: 10,
//                         offset: const Offset(0, 5),
//                       ),
//                     ],
//                   ),
//                   child: CircleAvatar(
//                     radius: 60,
//                     backgroundImage: AssetImage(testimonial.imageAsset),
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 // Quote with Innovative Design
//                 Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                   decoration: BoxDecoration(
//                     color: Colors.deepPurple.withOpacity(0.05),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Icon(
//                         Icons.format_quote_rounded,
//                         color: Colors.deepPurple,
//                         size: 30,
//                       ),
//                       Expanded(
//                         child: Text(
//                           testimonial.comment,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             color: Colors.black87,
//                             fontStyle: FontStyle.italic,
//                           ),
//                           textAlign: TextAlign.center,
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       const Icon(
//                         Icons.format_quote_rounded,
//                         color: Colors.deepPurple,
//                         size: 30,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 // Name and Position with Modern Typography
//                 Text(
//                   testimonial.name,
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w700,
//                     color: Color.fromARGB(255, 0, 0, 0),
//                     letterSpacing: 1.1,
//                   ),
//                 ),
//                 Text(
//                   testimonial.position,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     color: Color.fromARGB(255, 0, 0, 0),
//                     fontStyle: FontStyle.italic,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

  Widget _buildTestimonialCard(Testimonial testimonial, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromARGB(255, 251, 197, 0),
            const Color.fromARGB(0, 255, 153, 0).withOpacity(1),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 255, 255, 255).withOpacity(1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background Wave Design
          Positioned(
            top: -50,
            right: -50,
            child: Opacity(
              opacity: 0.2,
              child: Transform.rotate(
                angle: 0.5,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile Image with Unique Border
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          const Color.fromARGB(255, 5, 5, 5).withOpacity(0.5),
                      width: 4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(testimonial.imageAsset),
                  ),
                ),
                const SizedBox(height: 20),

                // Quote with Innovative Design
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.format_quote_rounded,
                        color: Colors.deepPurple,
                        size: 30,
                      ),
                      Expanded(
                        child: Text(
                          testimonial.comment,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(
                        Icons.format_quote_rounded,
                        color: Colors.deepPurple,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Name and Position with Modern Typography
                Text(
                  testimonial.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 0, 0, 0),
                    letterSpacing: 1.1,
                  ),
                ),
                Text(
                  testimonial.position,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontStyle: FontStyle.italic,
                  ),
                ),

                // LinkedIn Icon
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    final Uri url = Uri.parse(testimonial.linkedinUrl);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Could not launch ${testimonial.linkedinUrl}'),
                        ),
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade700,
                      shape: BoxShape.circle,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SocialMediaButton.linkedin(
                          url: testimonial.linkedinUrl,
                          color: Colors.white,
                          size: 30,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'LinkedIn',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
