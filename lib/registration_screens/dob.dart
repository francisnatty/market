import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DOBScreen extends StatefulWidget {
  final PageController controller;
  const DOBScreen({super.key, required this.controller});

  @override
  State<DOBScreen> createState() => _DOBScreenState();
}

class _DOBScreenState extends State<DOBScreen> {
  DateTime dateTime = DateTime(2023, 7, 17);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage('assets/age.jpg'))),
                ),
                Text(
                  'What\'s your age?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: 'MontserratBold'),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'You can only add your age once,you cannot change it later',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  child: CupertinoDatePicker(
                      dateOrder: DatePickerDateOrder.ymd,
                      showDayOfWeek: true,
                      minimumYear: 2006,
                      initialDateTime: dateTime,
                      use24hFormat: true,
                      onDateTimeChanged: (value) {}),
                )
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            left: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.circleArrowLeft,
                        size: 40,
                        color: Colors.pink,
                      ),
                      onPressed: () {
                        widget.controller.previousPage(
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.bounceIn);
                      },
                    ),
                    // Indicator(isActive: isActive)
                    IconButton(
                        onPressed: () {
                          widget.controller.nextPage(
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.bounceIn);
                        },
                        icon: Icon(
                          FontAwesomeIcons.circleArrowRight,
                          size: 40,
                          color: Colors.pink,
                        ))
                  ]),
            ),
          ),
        ]),
      )),
    );
  }
}
