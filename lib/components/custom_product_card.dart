import 'package:flutter/material.dart';
import 'package:megahertz_robotics/components/cards.dart';

import 'Custom_Card/custom_card.dart';

class CustomProductsCards extends StatelessWidget {
  const CustomProductsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CustomImageCardWidget(
                cardItems: [
                  CustomCardItem(
                      imagePath:
                          'assets/custom_project/custom_lith_battery.png',
                      title: 'Custom Lithium Ion Battery Pack',
                      onTap: () {/* Optional tap handler */}),
                  // Add more CardItems as needed
                ],
              ),
              CustomImageCardWidget(
                cardItems: [
                  CustomCardItem(
                      imagePath:
                          'assets/custom_project/custom_project_school.png',
                      title: 'Custom School / College Projects',
                      onTap: () {/* Optional tap handler */}),
                  // Add more CardItems as needed
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
