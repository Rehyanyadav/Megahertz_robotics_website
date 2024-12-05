import 'package:flutter/material.dart';

import '../components/products.dart';

class ProductSectionDesktop extends StatefulWidget {
  const ProductSectionDesktop({super.key});

  @override
  State<ProductSectionDesktop> createState() => _ProductSectionDesktopState();
}

class _ProductSectionDesktopState extends State<ProductSectionDesktop> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          NeonImageCard(
            imageAssetPath: 'assets/logo.png',
            title: 'Aurdrino ',
            description: 'Every types of Aurdrino available',
            width: 400,
            height: 400,
            onPrimaryButtonPressed: () {
              // Handle primary action
              print('Primary button pressed');
            },
            onSecondaryButtonPressed: () {
              // Handle secondary action
              print('Secondary button pressed');
            },
          ),
          const SizedBox(
            width: 50,
          ),
          NeonImageCard(
            imageAssetPath: 'assets/logo.png',
            title: 'Aurdrino ',
            description: 'Every types of Aurdrino available',
            width: 400,
            height: 400,
            onPrimaryButtonPressed: () {
              // Handle primary action
              print('Primary button pressed');
            },
            onSecondaryButtonPressed: () {
              // Handle secondary action
              print('Secondary button pressed');
            },
          ),
          const SizedBox(
            width: 50,
          ),
          NeonImageCard(
            imageAssetPath: 'assets/logo.png',
            title: 'Aurdrino ',
            description: 'Every types of Aurdrino available',
            width: 400,
            height: 400,
            onPrimaryButtonPressed: () {
              // Handle primary action
              print('Primary button pressed');
            },
            onSecondaryButtonPressed: () {
              // Handle secondary action
              print('Secondary button pressed');
            },
          ),
          const SizedBox(
            width: 50,
          ),
          NeonImageCard(
            imageAssetPath: 'assets/logo.png',
            title: 'Aurdrino ',
            description: 'Every types of Aurdrino available',
            width: 400,
            height: 400,
            onPrimaryButtonPressed: () {
              // Handle primary action
              print('Primary button pressed');
            },
            onSecondaryButtonPressed: () {
              // Handle secondary action
              print('Secondary button pressed');
            },
          ),
        ],
      ),
    );
  }
}
