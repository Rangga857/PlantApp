import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantapp_mobile/components/my_bottom_nav_bar.dart';
import 'package:plantapp_mobile/screens/home/components/body_home.dart';

import '../../constrants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BodyHome(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
AppBar buildAppBar() {
  return AppBar(
    backgroundColor: kPrimaryColor ,
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: () {},
    ),
  );
}