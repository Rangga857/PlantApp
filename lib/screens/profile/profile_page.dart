import 'package:flutter/material.dart';
import 'package:plantapp_mobile/components/my_bottom_nav_bar.dart';
import 'package:plantapp_mobile/constrants.dart';
import 'package:plantapp_mobile/screens/home/home_screen.dart';

class ProfilePage extends StatefulWidget {
  final Size size;
  const ProfilePage({
    super.key,
    required this.size});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? alamatDipilih;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
              height: widget.size.height * 0.2,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                      bottom: 36 + kDefaultPadding,
                    ),
                    height: widget.size.height * 0.2 - 27,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      height: 54,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: kPrimaryColor.withOpacity(0.23),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: kPrimaryColor.withOpacity(0.1),
                            radius: 16,
                            child: Icon(
                              Icons.person,
                              color: kPrimaryColor,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Rangga Azhar Fadillah',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kPrimaryColor,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}