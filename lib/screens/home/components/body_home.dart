import 'package:flutter/material.dart';
import 'package:plantapp_mobile/constrants.dart';
import 'package:plantapp_mobile/screens/home/components/featurred_plants.dart';
import 'package:plantapp_mobile/screens/home/components/header_with_searchbox.dart';
import 'package:plantapp_mobile/screens/home/components/recomend_plants.dart';
import 'package:plantapp_mobile/screens/home/components/title_with_more_btn.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchbox(size: size),
          TitleWithMoreBtn(title: "Recomended", press: () {}),
          RecomendPlants(),
          TitleWithMoreBtn(title: "Featured Plants", press: () {}),
          FeaturredPlants(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}