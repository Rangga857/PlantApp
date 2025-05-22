import 'package:flutter/material.dart';

class FeaturePlantCard extends StatelessWidget {
  final String image;
  final VoidCallback press;

  const FeaturePlantCard({
    super.key,
    required this.image,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return const Placeholder();
  }
}