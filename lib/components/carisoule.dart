import 'package:flutter/material.dart';

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
        duration: const Duration(milliseconds: 500),
        curve: widget.autoPlayCurve,
      );
    } else {
      _pageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 500),
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
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          widget.items[index],
                          // Gradient overlay
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.4),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Modern page indicator
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.items.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(horizontal: 6.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                    ),
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
      body: ResponsiveCarousel(
        items: [
          Image.asset('assets/achivements_Participation_photos/image01.jpg'),
          Image.asset('assets/achivements_Participation_photos/image02.jpg'),
          Image.asset('assets/achivements_Participation_photos/image04.jpg'),
          Image.asset('assets/achivements_Participation_photos/image06.jpg'),
          Image.asset('assets/achivements_Participation_photos/image07.jpg'),
        ],
        aspectRatio: 16 / 9,
        autoPlay: true,
      ),
    );
  }
}
