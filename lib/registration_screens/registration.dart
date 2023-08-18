import 'package:flutter/material.dart';
import 'package:market/registration_screens/OTP.dart';
import 'package:market/registration_screens/email.dart';
import 'package:market/registration_screens/gender.dart';
import 'package:market/registration_screens/landing.dart';
import 'package:market/registration_screens/name.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'dob.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  int currentPage = 0;
  PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Landing(),
      OTPScreen(
        controller: controller,
      ),
      DOBScreen(
        controller: controller,
      ),
      Gender(
        controller: controller,
      ),
      NameScreen(
        controller: controller,
      ),
      EmailScreen(
        controller: controller,
      ),
      // DOBScreen(),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
            child: Stack(
          children: [
            PageView.builder(
              controller: controller,
              onPageChanged: (int value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemBuilder: (context, index) {
                return pages[index];
              },
            ),
            Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                        pages.length,
                        (index) => Indicator(
                            isActive: currentPage == index ? true : false))
                  ],
                ))
            // Positioned(
            //   right: 0,
            //   bottom: 0,
            //   left: 0,
            //   child: Align(
            //     alignment: Alignment.bottomCenter,
            //     child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           IconButton(
            //             icon: Icon(
            //               FontAwesomeIcons.circleArrowLeft,
            //               size: 40,
            //               color: Colors.pink,
            //             ),
            //             onPressed: () {},
            //           ),
            //        // Indicator(isActive: isActive)
            //           IconButton(
            //               onPressed: () {},
            //               icon: Icon(
            //                 FontAwesomeIcons.circleArrowRight,
            //                 size: 40,
            //                 color: Colors.pink,
            //               ))
            //         ]),
            //   ),
            // )
          ],
        )),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({required this.isActive, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: isActive ? 15.0 : 8.0,
      height: 8.0,
      decoration: BoxDecoration(
          color: isActive ? Colors.pink : Colors.grey,
          borderRadius: BorderRadius.circular(8.0)),
    );
  }
}
