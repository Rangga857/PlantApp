import 'package:flutter/material.dart';
import 'package:plantapp_mobile/screens/home/components/feature_plant_card.dart';

class FeaturredPlants extends StatelessWidget {
  const FeaturredPlants({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          FeaturePlantCard(
            image: "assets/images/bottom_img_1.png",
            press: () {},
          ),
          FeaturePlantCard(
            image: "assets/images/bottom_img_2.png",
            press: () {},
          ),
        ],
      ),
    );
  }
}