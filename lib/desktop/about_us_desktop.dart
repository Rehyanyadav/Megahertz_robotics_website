import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutSectionDesktop extends StatefulWidget {
  const AboutSectionDesktop({super.key});

  @override
  State<AboutSectionDesktop> createState() => _AboutSectionDesktopState();
}

class _AboutSectionDesktopState extends State<AboutSectionDesktop> {
  // Control flags for animations
  final Map<String, bool> _isVisible = {
    'image1': false,
    'image2': false,
    'image3': false,
    'image4': false,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    VisibilityDetector(
                      key: const Key('image1'),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.1 &&
                            !_isVisible['image1']!) {
                          setState(() {
                            _isVisible['image1'] = true;
                          });
                        }
                      },
                      child: Image.asset(
                        'assets/aboutus/aboutus03.png',
                        width: 400,
                      )
                          .animate(
                            target: _isVisible['image1']! ? 1 : 0,
                          )
                          .fadeIn(
                            duration: const Duration(milliseconds: 800),
                          )
                          .scale(
                            duration: const Duration(seconds: 2),
                            curve: Curves.fastOutSlowIn,
                          ),
                    ),
                    SizedBox(
                      width: 500.0,
                      height: 50.0,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 255, 187, 0),
                          shadows: [
                            Shadow(
                              blurRadius: 7.0,
                              color: Colors.white,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                FlickerAnimatedText('Build your'),
                              ],
                            ),
                            const SizedBox(width: 10),
                            AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                FlickerAnimatedText('Custom Products with us '),
                              ],
                            ),
                          ],
                        ).animate().scale(
                              duration: const Duration(seconds: 2),
                              curve: Curves.fastOutSlowIn,
                            ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 700.0,
                      height: 50.0,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 255, 187, 0),
                          shadows: [
                            Shadow(
                              blurRadius: 7.0,
                              color: Colors.white,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                FlickerAnimatedText('Innovation'),
                              ],
                            ),
                            const SizedBox(width: 10),
                            AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                FlickerAnimatedText('Research '),
                              ],
                            ),
                            AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                FlickerAnimatedText('and Development '),
                              ],
                            ),
                          ],
                        ).animate().scale(
                              duration: const Duration(seconds: 2),
                              curve: Curves.fastOutSlowIn,
                            ),
                      ),
                    ),
                    VisibilityDetector(
                      key: const Key('image2'),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.1 &&
                            !_isVisible['image2']!) {
                          setState(() {
                            _isVisible['image2'] = true;
                          });
                        }
                      },
                      child: Image.asset(
                        'assets/aboutus/aboutus1.png',
                        height: 300,
                      )
                          .animate(
                            target: _isVisible['image2']! ? 1 : 0,
                          )
                          .fadeIn(
                            duration: const Duration(milliseconds: 800),
                          )
                          .scale(
                            duration: const Duration(seconds: 3),
                            curve: Curves.fastOutSlowIn,
                          )
                          .shimmer(
                            color: Colors.amber,
                            duration: const Duration(seconds: 3),
                          )
                          .saturate(
                            duration: const Duration(seconds: 2),
                            curve: Curves.fastOutSlowIn,
                            begin: 0.0,
                            end: 1.0,
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    VisibilityDetector(
                      key: const Key('image3'),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.1 &&
                            !_isVisible['image3']!) {
                          setState(() {
                            _isVisible['image3'] = true;
                          });
                        }
                      },
                      child: Image.asset(
                        'assets/aboutus/aboutus2.png',
                        height: 300,
                      )
                          .animate(
                            target: _isVisible['image3']! ? 1 : 0,
                          )
                          .fadeIn(
                            duration: const Duration(milliseconds: 800),
                          )
                          .scale(
                            duration: const Duration(seconds: 2),
                            curve: Curves.fastOutSlowIn,
                          )
                          .shimmer(
                            color: Colors.amber,
                            duration: const Duration(seconds: 3),
                          )
                          .saturate(
                            duration: const Duration(seconds: 2),
                          ),
                    ),
                    const Spacer(),
                    VisibilityDetector(
                      key: const Key('image4'),
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.1 &&
                            !_isVisible['image4']!) {
                          setState(() {
                            _isVisible['image4'] = true;
                          });
                        }
                      },
                      child: Image.asset(
                        'assets/aboutus/aboutus0.png',
                        height: 300,
                      )
                          .animate(
                            target: _isVisible['image4']! ? 1 : 0,
                          )
                          .fadeIn(
                            duration: const Duration(milliseconds: 800),
                          )
                          .scale(
                            duration: const Duration(seconds: 3),
                            curve: Curves.fastOutSlowIn,
                          )
                          .shimmer(
                            color: Colors.amber,
                            duration: const Duration(seconds: 3),
                          )
                          .saturate(
                            duration: const Duration(seconds: 2),
                            curve: Curves.fastOutSlowIn,
                            begin: 0.0,
                            end: 1.0,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
