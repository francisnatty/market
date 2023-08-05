import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:market/API/getData.dart';
import 'package:market/UserProfile/page_view.dart';
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

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int currentIndex = 0;
  static const List<Widget> _widgetOptions = [
    Home(),
    Profile(),
    ProfileThree(),
    //  EditScreen(),
    UserProfile(),

    // Center(
    //   child: Text('Senior mobile app developer'),
    // ),
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
