import 'package:flutter/material.dart';

import '../../../constrants.dart';

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
    Size size = MediaQuery.of(context).size;
    return Container(
       margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23)
                  )
                ]
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: 
                            Theme.of(context).textTheme.labelLarge,
                        ),
                        TextSpan(
                          text: "$country\n".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          )
                        ),
                      ]
                    )
                  ),
                  Spacer(),
                  Text(
                    '\$$price',
                    style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: kPrimaryColor
                    )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}