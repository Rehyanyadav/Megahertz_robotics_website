import 'package:flutter/material.dart';
import 'package:megahertz_robotics/widgets/cards.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductsCards extends StatefulWidget {
  const ProductsCards({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductsCardsState createState() => _ProductsCardsState();
}

class _ProductsCardsState extends State<ProductsCards> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // First row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController, // Use the same controller
            child: Row(
              children: [
                ImageCardWidget(
                  cardItems: [
                    CardItem(
                        imagePath: 'assets/parts/Arduino Boards.png',
                        title: 'Development Boards | Accessories',
                        onTap: () async {
                          // Open link action
                          final Uri url = Uri.parse(
                              'https://alphacodes101.github.io/megahertz_ordering_system/');

                          if (await canLaunchUrl(url)) {
                            launchUrl(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }),
                  ],
                ),
                ImageCardWidget(
                  cardItems: [
                    CardItem(
                        imagePath: 'assets/parts/Sensors 2.png',
                        title: 'Sensors | Modules',
                        onTap: () async {
                          // Open link action
                          final Uri url = Uri.parse(
                              'https://alphacodes101.github.io/megahertz_ordering_system/');

                          if (await canLaunchUrl(url)) {
                            launchUrl(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }),
                  ],
                ),
                ImageCardWidget(
                  cardItems: [
                    CardItem(
                        imagePath: 'assets/parts/IOT and Wireless.png',
                        title: 'IoT & Wireless',
                        onTap: () async {
                          // Open link action
                          final Uri url = Uri.parse(
                              'https://alphacodes101.github.io/megahertz_ordering_system/');

                          if (await canLaunchUrl(url)) {
                            launchUrl(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }),
                  ],
                ),
                ImageCardWidget(
                  cardItems: [
                    CardItem(
                        imagePath: 'assets/parts/wires and cables.png',
                        title: 'Wires | Cables | Heat Shrinks ',
                        onTap: () async {
                          // Open link action
                          final Uri url = Uri.parse(
                              'https://alphacodes101.github.io/megahertz_ordering_system/');

                          if (await canLaunchUrl(url)) {
                            launchUrl(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Second row - Scrolls together with the first row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController, // Use the same controller
            child: Row(
              children: [
                ImageCardWidget(
                  cardItems: [
                    CardItem(
                        imagePath: 'assets/parts/motors and drivers.png',
                        title:
                            """Motors | Drivers | Pumps | Actuators | Wheels""",
                        onTap: () async {
                          // Open link action
                          final Uri url = Uri.parse(
                              'https://alphacodes101.github.io/megahertz_ordering_system/');

                          if (await canLaunchUrl(url)) {
                            launchUrl(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }),
                  ],
                ),
                ImageCardWidget(
                  cardItems: [
                    CardItem(
                        imagePath: 'assets/parts/batterys.png',
                        title: 'Batteries | Chargers & Accessories',
                        onTap: () async {
                          // Open link action
                          final Uri url = Uri.parse(
                              'https://alphacodes101.github.io/megahertz_ordering_system/');

                          if (await canLaunchUrl(url)) {
                            launchUrl(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }),
                  ],
                ),
                ImageCardWidget(
                  cardItems: [
                    CardItem(
                        imagePath:
                            'assets/parts/electronic modules and displays.png',
                        title: 'Electronic Modules & Displays',
                        onTap: () async {
                          // Open link action
                          final Uri url = Uri.parse(
                              'https://alphacodes101.github.io/megahertz_ordering_system/');

                          if (await canLaunchUrl(url)) {
                            launchUrl(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }),
                  ],
                ),
                ImageCardWidget(
                  cardItems: [
                    CardItem(
                        imagePath: 'assets/parts/electronics components.png',
                        title: 'Electronics Components | Breadboards | PCBs ',
                        onTap: () async {
                          // Open link action
                          final Uri url = Uri.parse(
                              'https://alphacodes101.github.io/megahertz_ordering_system/');

                          if (await canLaunchUrl(url)) {
                            launchUrl(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }),
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
