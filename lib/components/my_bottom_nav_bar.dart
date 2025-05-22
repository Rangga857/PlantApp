import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantapp_mobile/constrants.dart';
import 'package:plantapp_mobile/screens/camera/picture_page.dart';
import 'package:plantapp_mobile/screens/home/home_screen.dart';
import 'package:plantapp_mobile/screens/profile/profile_page.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/flower.svg"),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => HomeScreen())
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.camera_alt_outlined,
              color: Colors.grey,),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => PicturePage())
              );
            },
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/user-icon.svg"),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => ProfilePage(size: MediaQuery.of(context).size))
              );
            },
          ),
        ],
      ),
    );
  }
}