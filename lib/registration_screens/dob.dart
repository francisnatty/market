import 'package:flutter/material.dart';

class DOBScreen extends StatefulWidget {
  const DOBScreen({super.key});

  @override
  State<DOBScreen> createState() => _DOBScreenState();
}

class _DOBScreenState extends State<DOBScreen> {
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
            ]),
          )
        ]),
      )),
    );
  }
}
