import 'package:flutter/material.dart';
import 'package:market/UserProfile/profile.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final _Controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(scrollDirection: Axis.vertical, children: [
        Profile(),
        Profile(),
        Profile(),
      ]),
    );
  }
}
