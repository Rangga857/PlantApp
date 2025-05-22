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
          Row(
            children: <Widget>[
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                      ),
                    ),
                    backgroundColor: kPrimaryColor,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Buy Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Text("Description"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}