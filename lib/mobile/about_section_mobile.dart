import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:megahertz_robotics/mobile/carisoule_for_about.dart';

class AboutSectionMobTab extends StatelessWidget {
  const AboutSectionMobTab({super.key});

  // Static constants for reused values
  static const _animationDuration = Duration(seconds: 2);
  static const _shimmerDuration = Duration(seconds: 3);
  static const _textStyle = TextStyle(
    fontSize: 18,
    color: Color.fromARGB(255, 255, 187, 0),
    shadows: [
      Shadow(
        blurRadius: 7.0,
        color: Colors.white,
        offset: Offset.zero,
      ),
    ],
  );

  // Memoized carousel items
  static final _carouselItems = [
    _buildCarouselImage('assets/aboutus/aboutus1.png'),
    _buildCarouselImageWithShimmer('assets/aboutus/aboutus2.png'),
    _buildCarouselImageWithShimmer('assets/aboutus/aboutus0.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.black,
      child: SingleChildScrollView(
        // Added for better performance with long content
        child: Column(
          children: [
            _HeaderSection(),
            _CarouselSection(),
          ],
        ),
      ),
    );
  }

  // Extracted to separate widgets for better performance
  static Widget _buildCarouselImage(String assetPath) {
    return Center(
      child: Image.asset(
        assetPath,
        // Added image optimization parameters
        cacheWidth: 800, // Adjust based on your needs
        filterQuality: FilterQuality.medium,
      ),
    );
  }

  static Widget _buildCarouselImageWithShimmer(String assetPath) {
    return Center(
      child: Image.asset(
        assetPath,
        cacheWidth: 800,
        filterQuality: FilterQuality.medium,
      ).animate().shimmer(
            color: Colors.amber,
            duration: _shimmerDuration,
          ),
    );
  }
}

// Separated into a dedicated widget for better performance
class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          _AnimatedLogo(),
          _AnimatedText(),
        ],
      ),
    );
  }
}

class _AnimatedLogo extends StatelessWidget {
  const _AnimatedLogo();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/aboutus/aboutus03.png',
      width: 250,
      // Added image optimization parameters
      cacheWidth: 500,
      filterQuality: FilterQuality.medium,
    )
        .animate()
        .slideX(
          duration: AboutSectionMobTab._animationDuration,
          curve: Curves.fastLinearToSlowEaseIn,
        )
        .shimmer(
          color: Colors.amber,
          duration: AboutSectionMobTab._shimmerDuration,
        );
  }
}

class _AnimatedText extends StatelessWidget {
  const _AnimatedText();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: DefaultTextStyle(
        style: AboutSectionMobTab._textStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildAnimatedTextKit('Build your'),
            const SizedBox(width: 10),
            _buildAnimatedTextKit('Custom Products'),
            _buildAnimatedTextKit('with us'),
          ],
        ).animate().scale(
              duration: AboutSectionMobTab._animationDuration,
              curve: Curves.fastOutSlowIn,
            ),
      ),
    );
  }

  Widget _buildAnimatedTextKit(String text) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [FlickerAnimatedText(text)],
    );
  }
}

class _CarouselSection extends StatelessWidget {
  const _CarouselSection();

  @override
  Widget build(BuildContext context) {
    return AboutUsCarisoule(
      items: AboutSectionMobTab._carouselItems,
      aspectRatio: 16 / 9,
      autoPlay: true,
    )
        .animate()
        .slideX(
          duration: AboutSectionMobTab._animationDuration,
          curve: Curves.fastOutSlowIn,
        )
        .scale(
          duration: AboutSectionMobTab._animationDuration,
          curve: Curves.fastOutSlowIn,
        )
        .shimmer(
          color: Colors.amber,
          duration: AboutSectionMobTab._shimmerDuration,
        );
  }
}
