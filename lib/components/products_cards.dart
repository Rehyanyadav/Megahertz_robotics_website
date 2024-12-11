import 'package:flutter/material.dart';
import 'package:megahertz_robotics/components/cards.dart';

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
    return Column(
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
                      title: 'Arduino Boards | Accessories',
                      onTap: () {}),
                ],
              ),
              ImageCardWidget(
                cardItems: [
                  CardItem(
                      imagePath: 'assets/parts/Sensors 2.png',
                      title: 'Sensors | Modules',
                      onTap: () {}),
                ],
              ),
              ImageCardWidget(
                cardItems: [
                  CardItem(
                      imagePath: 'assets/parts/IOT and Wireless.png',
                      title: 'IOT | Wireless',
                      onTap: () {}),
                ],
              ),
              ImageCardWidget(
                cardItems: [
                  CardItem(
                      imagePath: 'assets/parts/wires and cables.png',
                      title: 'Wires | Cables',
                      onTap: () {}),
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
                      title: 'Motors | Drivers',
                      onTap: () {}),
                ],
              ),
              ImageCardWidget(
                cardItems: [
                  CardItem(
                      imagePath: 'assets/parts/batterys.png',
                      title: 'Battery | charger',
                      onTap: () {}),
                ],
              ),
              ImageCardWidget(
                cardItems: [
                  CardItem(
                      imagePath:
                          'assets/parts/electronic modules and displays.png',
                      title: 'Electronics modules | Displays',
                      onTap: () {}),
                ],
              ),
              ImageCardWidget(
                cardItems: [
                  CardItem(
                      imagePath: 'assets/parts/electronics components.png',
                      title: 'Electronics Components',
                      onTap: () {}),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
