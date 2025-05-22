import 'package:flutter/material.dart';

import '../../../constrants.dart';

class TitleAndPrice extends StatelessWidget {
  final String title, country;
  final int price;

  const TitleAndPrice(
    {super.key,
    required this.title,
    required this.country,
    required this.price
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title\n",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: kTextColor, 
                    fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: country,
                  style: TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            "\$$price",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: kPrimaryColor),
          )
        ],
      ),
    );
  }
}