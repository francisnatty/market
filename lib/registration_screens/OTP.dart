import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  final PageController controller;
  const OTPScreen({super.key, required this.controller});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SafeArea(
            child: Stack(children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('assets/email.jpg'))),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Email Verification code',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'MontserratBold',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                  textAlign: TextAlign.center,
                  'We sent a verification code to fnathnaiel929@gmail.com'),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    pinScreen('1'),
                    pinScreen('5'),
                    pinScreen('8'),
                    pinScreen('9'),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn\'t receive the OTP?',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'RESEND OTP',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  child: Text(
                    'VERIFY & PROCEED',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  onPressed: () {
                    widget.controller.nextPage(
                        duration: Duration(milliseconds: 50),
                        curve: Curves.easeInCubic);
                  },
                ),
              )
            ],
          ),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: Container(
          //     decoration: BoxDecoration(
          //         shape: BoxShape.circle, color: Colors.grey.withOpacity(0.1)),
          //     child: IconButton(
          //       icon: Icon(
          //         Icons.arrow_forward_ios,
          //         color: Colors.pink,
          //       ),
          //       onPressed: () {},
          //     ),
          //   ),
          // )
        ])),
      ),
    );
  }

  Container pinScreen(String title) {
    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.1)),
        child: Text(
          title,
          style: TextStyle(fontSize: 15, fontFamily: 'MontserratBold'),
        ));
  }
}
