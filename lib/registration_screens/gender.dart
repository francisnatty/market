import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

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
              Text(
                'What\s your gender?',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'MontserratBold'),
              ),
              SizedBox(
                height: 30,
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
          )
        ]),
      )),
    );
  }
}
