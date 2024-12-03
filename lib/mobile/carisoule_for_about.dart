import 'dart:async';

import 'package:flutter/material.dart';

class AboutUsCarisoule extends StatefulWidget {
  final List<Widget> items;
  final double? height;
  final double aspectRatio;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final Curve autoPlayCurve;
  final PageController? controller;

  const AboutUsCarisoule({
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
  _AboutUsCarisouleState createState() => _AboutUsCarisouleState();
}

class _AboutUsCarisouleState extends State<AboutUsCarisoule> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _autoPlayTimer;

  @override
  void initState() {
    super.initState();
    _pageController = widget.controller ?? PageController(initialPage: 0);

    if (widget.autoPlay) {
      _startAutoPlay();
    }
  }

  void _startAutoPlay() {
    _autoPlayTimer = Timer.periodic(widget.autoPlayInterval, (_) {
      if (mounted) {
        _nextPage();
      }
    });
  }

  void _nextPage() {
    final nextPage = (_currentPage + 1) % widget.items.length;
    _pageController.animateToPage(
      nextPage,
      duration: const Duration(milliseconds: 300),
      curve: widget.autoPlayCurve,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
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
                  setState(() => _currentPage = index);
                },
                itemBuilder: (context, index) => widget.items[index],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _autoPlayTimer.cancel();
    if (widget.controller == null) {
      _pageController.dispose();
    }
    super.dispose();
  }
}
