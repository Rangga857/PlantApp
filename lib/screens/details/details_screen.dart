import 'package:flutter/material.dart';
import 'package:plantapp_mobile/screens/details/components/body_detail.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyDetail(),
    );
  }
}