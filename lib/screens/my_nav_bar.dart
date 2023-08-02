import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:market/API/getData.dart';
import 'package:market/UserProfile/page_view.dart';
import 'package:market/screens/add_money.dart';
import 'package:market/screens/home.dart';
import 'package:market/screens/pinScreen/pin__screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../API/world_time_api.dart';
import '../PageView/page_view.dart';
import '../UserProfile/profile.dart';
import '../UserProfile/user_profile.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int currentIndex = 0;
  static const List<Widget> _widgetOptions = [
    HomeScreen(),
    UserProfile(),
    //PageViewer(),
    //Profile(),
    MyPageView(),
    WorldTimeApi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(currentIndex),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: (i) {
          setState(() {
            currentIndex = i;
          });
        },
        items: [
          SalomonBottomBarItem(
              icon: Icon(Iconsax.home),
              title: Text('Home'),
              selectedColor: Colors.black),
          SalomonBottomBarItem(
              icon: Icon(Iconsax.wallet4),
              title: Text('wallet'),
              selectedColor: Colors.orange),
          SalomonBottomBarItem(
            icon: Icon(Iconsax.message4),
            title: Text("group"),
            selectedColor: Colors.teal,
          ),
          SalomonBottomBarItem(
            icon: Icon(Iconsax.user),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
