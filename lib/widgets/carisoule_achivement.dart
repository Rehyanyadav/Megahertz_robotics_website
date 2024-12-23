import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ResponsiveCarousel extends StatelessWidget {
  final List<String> imagePaths;

  const ResponsiveCarousel({super.key, required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final carouselHeight = screenWidth >= 1000 ? 300.0 : 250.0;

    return CarouselSlider(
      options: CarouselOptions(
        height: carouselHeight,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: screenWidth >= 1000 ? 0.3 : 0.9,
      ),
      items: imagePaths.map((path) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            path,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        );
      }).toList(),
    );
  }
}
