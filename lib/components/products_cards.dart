import 'package:flutter/material.dart';
import 'package:megahertz_robotics/components/cards.dart';

class ProductsCards extends StatelessWidget {
  const ProductsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ImageCardWidget(
                cardItems: [
                  CardItem(
                      imagePath: 'assets/logo.png',
                      title: 'Audrino Boards | Assesories',
                      onTap: () {/* Optional tap handler */}),
                  // Add more CardItems as needed
                ],
              ),
              ImageCardWidget(
                cardItems: [
                  CardItem(
                      imagePath: 'assets/logo.png',
                      title: 'Sensors | Modules',
                      onTap: () {/* Optional tap handler */}),
                  // Add more CardItems as needed
                ],
              ),
              ImageCardWidget(
                cardItems: [
                  CardItem(
                      imagePath: 'assets/logo.png',
                      title: 'IOT | Wireless',
                      onTap: () {/* Optional tap handler */}),
                  // Add more CardItems as needed
                ],
              ),
              ImageCardWidget(
                cardItems: [
                  CardItem(
                      imagePath: 'assets/logo.png',
                      title: 'Wires | Cables',
                      onTap: () {/* Optional tap handler */}),
                  // Add more CardItems as needed
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ImageCardWidget(
                cardItems: [
                  CardItem(
                      imagePath: 'assets/logo.png',
                      title: 'Motors | Drivers',
                      onTap: () {/* Optional tap handler */}),
                  // Add more CardItems as needed
                ],
              ),
              ImageCardWidget(
                cardItems: [
                  CardItem(
                      imagePath: 'assets/logo.png',
                      title: 'Battery | charger',
                      onTap: () {/* Optional tap handler */}),
                  // Add more CardItems as needed
                ],
              ),
              ImageCardWidget(
                cardItems: [
                  CardItem(
                      imagePath: 'assets/logo.png',
                      title: 'Electronics modules | Displays',
                      onTap: () {/* Optional tap handler */}),
                  // Add more CardItems as needed
                ],
              ),
              ImageCardWidget(
                cardItems: [
                  CardItem(
                      imagePath: 'assets/logo.png',
                      title: 'Electronics Components',
                      onTap: () {/* Optional tap handler */}),
                  // Add more CardItems as needed
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
