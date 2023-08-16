import 'package:flutter/material.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

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
              Text(
                'What\'s is your Email?',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'MontserratBold',
                    fontSize: 30,
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
}
