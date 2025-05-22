import 'package:flutter/material.dart';
import 'package:plantapp_mobile/screens/details/components/image_and_icons.dart';
import 'package:plantapp_mobile/screens/details/components/title_and_price.dart';

import '../../../constrants.dart';

class BodyDetail extends StatelessWidget {
  const BodyDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(size: size),
          TitleAndPrice(title: "Angelica", country: "Russia", price: 440),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}