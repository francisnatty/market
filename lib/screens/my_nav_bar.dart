import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:market/API/country.dart';
import 'package:market/API/getData.dart';
import 'package:market/UserProfile/page_view.dart';
import 'package:market/UserProfile/top_sheet.dart';
import 'package:market/match/match_screen.dart';
import 'package:market/registration_screens/dob.dart';
import 'package:market/registration_screens/email.dart';
import 'package:market/registration_screens/name.dart';
import 'package:market/registration_screens/registration.dart';
import 'package:market/screens/add_money.dart';
import 'package:market/screens/home.dart';
import 'package:market/screens/pinScreen/pin__screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../UserProfile/edit.dart';
import '../UserProfile/home_screen.dart';
import '../UserProfile/picker.dart';

import '../UserProfile/profile.dart';

import '../UserProfile/profile_three.dart';
import '../UserProfile/profile_twwo.dart';
import '../UserProfile/user_profile.dart';
import '../match/crew.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  int _bottomNavIndex = 0;
  Border Unselectedborder =
      Border.fromBorderSide(BorderSide(color: Colors.white));
  Border selectedborder = Border.fromBorderSide(BorderSide(color: Colors.pink));
  List<IconData> iconList = [
    (Icons.abc),
    Icons.home,
    Icons.abc_rounded,
    Icons.abc_outlined,
  ];
  final items = [
    const Icon(
      Iconsax.home,
      size: 30,
    ),
    const Icon(
      Icons.abc,
      size: 30,
    ),
    const Icon(
      Icons.abc,
      size: 30,
    ),
    const Icon(
      Icons.verified_user,
      size: 30,
    ),
    SizedBox(
      height: 30,
      width: 30,
      child: CircleAvatar(
        backgroundImage: AssetImage(
          'assets/girl.jpg',
        ),
      ),
    )
  ];
  static const List<Widget> _widgetOptions = [
    Registration(),
    // EmailScreen(),
    WorldTimeApi(),
    WorldTimeApi(),
    EditScreen(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    TabController controller = TabController(length: 4, vsync: this);
    return Scaffold(
      body: _widgetOptions.elementAt(currentIndex),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.black,
        items: [
          CurvedNavigationBarItem(
              child: Icon(
                Iconsax.home,
                color: Colors.white,
              ),
              label: 'Circle',
              labelStyle: TextStyle(color: Colors.white)),
          CurvedNavigationBarItem(
              child: Icon(
                Iconsax.message4,
                color: Colors.white,
              ),
              label: 'Chat',
              labelStyle: TextStyle(color: Colors.white)),
          CurvedNavigationBarItem(
              child: Icon(
                Iconsax.discover,
                color: Colors.white,
              ),
              label: 'Discover',
              labelStyle: TextStyle(color: Colors.white)),
          CurvedNavigationBarItem(
              child: Icon(
                Iconsax.user_search1,
                color: Colors.white,
              ),
              label: 'Matches',
              labelStyle: TextStyle(color: Colors.white)),
          CurvedNavigationBarItem(
              child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircleAvatar(
                      backgroundImage: AssetImage('assets/girl.jpg'))),
              label: 'Me',
              labelStyle: TextStyle(color: Colors.white))
        ],
        index: currentIndex,
        buttonBackgroundColor: Colors.pink,
        onTap: (index) {
          setState(() {
            this.currentIndex = index;
          });
        },
      ),
    );
  }
}

class TabOne extends StatelessWidget {
  const TabOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('my name is natty')),
    );
  }
}
