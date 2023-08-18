import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Stack(children: [
            Column(
              children: [
                Text(
                  'Welcome to Latte',
                  style: TextStyle(
                      fontFamily: 'Victor',
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.7,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/check.webp'))),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Find Love and \nDitch Us',
                  style: TextStyle(fontFamily: 'Victor', fontSize: 30),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.pink),
                  child: Text(
                    'CONTINUE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Positioned(
            //     bottom: 100,
            //     child:
            //   ),
            // ),
          ]),
        ),
      ),
    );
  }
}
