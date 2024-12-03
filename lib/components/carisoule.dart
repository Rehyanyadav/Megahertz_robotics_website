import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResponsiveCarousel extends StatefulWidget {
  final List<Widget> items;
  final double? height;
  final double aspectRatio;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final Curve autoPlayCurve;
  final PageController? controller;

  const ResponsiveCarousel({
    super.key,
    required this.items,
    this.height,
    this.aspectRatio = 16 / 9,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.autoPlayCurve = Curves.fastOutSlowIn,
    this.controller,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ResponsiveCarouselState createState() => _ResponsiveCarouselState();
}

class _ResponsiveCarouselState extends State<ResponsiveCarousel> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = widget.controller ?? PageController(initialPage: 0);

    if (widget.autoPlay) {
      _startAutoPlay();
    }
  }

  void _startAutoPlay() {
    Future.delayed(widget.autoPlayInterval).then((_) {
      if (mounted) {
        _nextPage();
      }
    });
  }

  void _nextPage() {
    if (_currentPage < widget.items.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: widget.autoPlayCurve,
      );
    } else {
      _pageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 40),
        curve: widget.autoPlayCurve,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate the height based on aspect ratio or provided height
        final carouselHeight =
            widget.height ?? (constraints.maxWidth / widget.aspectRatio);

        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: carouselHeight,
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.items.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });

                  if (widget.autoPlay) {
                    _startAutoPlay();
                  }
                },
                itemBuilder: (context, index) {
                  return widget.items[index];
                },
              ),
            ),
            // Indicator dots
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.items.length,
                  (index) => Container(
                    width: 10.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _pageController.dispose();
    }
    super.dispose();
  }
}

// Example Usage
class CarouselExample extends StatelessWidget {
  const CarouselExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive Carousel Demo')),
      body: ResponsiveCarousel(
        items: [
          // Example items - replace with your own widgets
          Container(color: Colors.red, child: Image.asset('assets/logo.png')),
          Container(
            color: Colors.green,
            child: Stack(
              children: [
                Text('OUR ACHIVEMENTS',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.abel().fontFamily)),
                Image.asset('assets/logo.png')
              ],
            ),
          ),
          Container(
              color: Colors.blue,
              child: Center(
                child: Image.asset('assets/logo.png'),
              )),

          Container(
              color: Colors.blue,
              child: Center(
                child: Image.asset('assets/logo.png'),
              ))
        ],
        aspectRatio: 16 / 9,
        autoPlay: true,
      ),
    );
  }
}
