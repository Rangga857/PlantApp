import 'package:flutter/material.dart';
import 'package:plantapp_mobile/constrants.dart';

class TitleWithCustomUnderline extends StatelessWidget {
  final String text;

  const TitleWithCustomUnderline(
    {super.key,
    required this.text
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
            margin: EdgeInsets.only(right: kDefaultPadding / 4),
            height: 7,
            color: kPrimaryColor.withOpacity(0.2),
          ),)
        ],
      ) ,
    );
  }
}