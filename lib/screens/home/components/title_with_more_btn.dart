import 'package:flutter/material.dart';
import 'package:plantapp_mobile/constrants.dart';
import 'package:plantapp_mobile/screens/home/components/title_with_custom_underline.dart';

class TitleWithMoreBtn extends StatelessWidget {
  final String title;
  final VoidCallback press;

  const TitleWithMoreBtn(
    {super.key,
    required this.title,
    required this.press,
    }
    );

  @override
  Widget build(BuildContext context) {
    return Padding
    (padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
    child: Row(
      children: <Widget>[
        TitleWithCustomUnderline(text: title),
        const Spacer(),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
          ),
          onPressed: press,
          child: const Text(
            "More",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],)
    );
  }
}