import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmailScreen extends StatefulWidget {
  final PageController controller;
  const EmailScreen({super.key, required this.controller});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SafeArea(
            child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Text(
                'What\'s your Email?',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'MontserratBold',
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Email Address'),
              ),
            ],
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
        ])),
      ),
    );
  }
}
