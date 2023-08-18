import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';

class NameScreen extends StatefulWidget {
  final PageController controller;
  const NameScreen({super.key, required this.controller});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formkey,
          child: SafeArea(
              child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What is your name?',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'MontserratBold',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Firstname field cannot be empty';
                    } else if (value.length > 40) {
                      return 'firstname cannot be more than 40 characters';
                    }
                    return null;
                  },
                  maxLength: 40,
                  decoration: InputDecoration(
                    hintText: 'First name (required)',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  maxLength: 40,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lastname field cannot  be empty';
                    } else if (value.length > 40) {
                      return 'LastName cannot be more than 40 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: 'Last name'),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.1)),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.pink,
                  ),
                  onPressed: () {
                    _formkey.currentState!.validate();
                  },
                ),
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
          ])),
        ),
      ),
    );
  }
}
