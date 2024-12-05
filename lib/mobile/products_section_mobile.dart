import 'package:flutter/material.dart';

import '../components/products.dart';

class ProductSectionMobTab extends StatefulWidget {
  const ProductSectionMobTab({super.key});

  @override
  State<ProductSectionMobTab> createState() => _ProductSectionMobTabState();
}

class _ProductSectionMobTabState extends State<ProductSectionMobTab> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        NeonImageCard(
          imageAssetPath: 'assets/logo.png',
          width: 300,
          height: 200,
          intensity: 0.5,
          glowSpread: 0.8,
        ),
        SizedBox(height: 20),
        NeonImageCard(
          imageAssetPath: 'assets/logo.png',
          width: 300,
          height: 200,
          intensity: 0.5,
          glowSpread: 0.8,
        ),
        SizedBox(height: 20),
        NeonImageCard(
          imageAssetPath: 'assets/logo.png',
          width: 300,
          height: 200,
          intensity: 0.5,
          glowSpread: 0.8,
        ),
      ],
    );
  }
}
