import 'package:flutter/material.dart';
import 'package:market/registration_screens/email.dart';
import 'package:market/registration_screens/gender.dart';
import 'package:market/registration_screens/name.dart';

import 'dob.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          PageView(
            controller: controller,
            reverse: true,
            children: [
              DOBScreen(),
              Gender(),
              NameScreen(),
              EmailScreen(),
              DOBScreen(),
            ],
          ),
          // Positioned(
          //   right: 0,
          //   bottom: 0,
          //   child: Align(
          //     alignment: Alignment.bottomLeft,
          //     child: Row(children: [
          //       // TextButton(onPressed: (){}, child: Text('skip'))
          //       IconButton(
          //           onPressed: () {},
          //           icon: Icon(Icons.arrow_forward_ios_outlined))
          //     ]),
          //   ),
          // )
        ],
      )),
    );
  }
}
