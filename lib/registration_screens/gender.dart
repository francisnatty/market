import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Gender extends StatefulWidget {
  final PageController controller;
  const Gender({super.key, required this.controller});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  Color buttonColor = Colors.grey.withOpacity(0.2);
  Color buttonClickedColor = Colors.pink;
  bool isButtonClicked2 = false;
  bool isButtonClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: Column(children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/gender.webp'))),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'What\s your gender?',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'MontserratBold'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'You can only add your gender once,you cannot change it later',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 30,
              ),

              // Wrap(
              //   children: [
              //     CircleAvatar(
              //       radius: 20,
              //       child: Text('Male'),
              //     )
              //   ],
              // )
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: isButtonClicked
                              ? buttonClickedColor
                              : buttonColor),
                      onPressed: () {
                        setState(() {
                          isButtonClicked = true;
                          isButtonClicked2 = false;
                        });
                      },
                      child: Text(
                        'Male',
                        style: TextStyle(color: Colors.white),
                      )),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: isButtonClicked2
                              ? buttonClickedColor
                              : buttonColor),
                      onPressed: () {
                        setState(() {
                          isButtonClicked2 = true;
                          isButtonClicked = false;
                        });
                      },
                      child: Text(
                        'Female',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )
            ]),
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
          )
        ]),
      )),
    );
  }
}
