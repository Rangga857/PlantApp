import 'package:flutter/material.dart';

class RecomendPlantCard extends StatelessWidget {
  final String image;
  final String title;
  final String country;
  final int price;
  final VoidCallback press;

  const RecomendPlantCard(
    {super.key,
    required this.image,
    required this.country,
    required this.press,
    required this.price,
    required this.title
    });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}