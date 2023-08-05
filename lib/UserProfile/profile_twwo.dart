import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileTwo extends StatefulWidget {
  const ProfileTwo({super.key});

  @override
  State<ProfileTwo> createState() => _ProfileTwoState();
}

class _ProfileTwoState extends State<ProfileTwo> {
  final _contoller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/dark.jpeg',
            fit: BoxFit.cover,
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.grey.withOpacity(0.1),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.withOpacity(0.1)),
                  child: Icon(
                    Iconsax.edit,
                    color: Colors.pink,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.withOpacity(0.1)),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.pink,
                  )),
            ),
          ),
          // Align(
          //   child: SizedBox(
          //     height: MediaQuery.of(context).size.height,
          //     child: Container(
          //       padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          //       child: Positioned.fill(
          //         child: Container(
          //           child: ClipRRect(
          //             borderRadius: BorderRadius.circular(30),
          //             child: Image.asset(
          //               'assets/dark.jpeg',
          //               height: MediaQuery.of(context).size.height,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          PageView(
            controller: _contoller,
            scrollDirection: Axis.vertical,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
                child: ClipRRect(child: Image.asset('assets/dark.jpeg')),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
                child: ClipRRect(child: Image.asset('assets/dark.jpeg')),
              )
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
                child: Positioned.fill(
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 10,
                        left: 0.0,
                        right: 0.0,
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            // width: double.infinity,
                            padding: EdgeInsets.all(20),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Natty, 21',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Iconsax.location,
                                          color: Colors.pink,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text('Florida,miami')
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              aboutUser(),
              interests()
              // aboutUser(),
            ]),
          ))
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: aboutUser(),
          // )
        ],
      ),
    ));
  }

  Container aboutUser() {
    return Container(
      // height: MediaQuery.of(context).size.height / 3,
      padding: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.6)),
        child: Column(children: [
          Text('About Me'),
          const Divider(
            color: Colors.pink,
            thickness: 0.2,
          ),
          Row(
            children: [
              Icon(
                Icons.location_city,
                color: Colors.pink,
              ),
              SizedBox(
                width: 20,
              ),
              Text('Federal University of technology'),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                Iconsax.location,
                color: Colors.pink,
              ),
              SizedBox(
                width: 20,
              ),
              Text('minna'),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                Icons.school_sharp,
                color: Colors.pink,
              ),
              SizedBox(
                width: 20,
              ),
              Text('Graduate'),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                Iconsax.user4,
                color: Colors.pink,
              ),
              SizedBox(
                width: 20,
              ),
              Text('male'),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                Icons.height,
                color: Colors.pink,
              ),
              SizedBox(
                width: 20,
              ),
              Text('162cm'),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ]),
      ),
    );
  }

  Container interests() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'interests',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
              ),
              const Divider(
                color: Colors.pink,
              ),
              Row(
                children: [
                  interestItems('Programming'),
                  SizedBox(
                    width: 20,
                  ),
                  interestItems('hacking'),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  interestItems('eating'),
                  SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          )),
    );
  }

  Container interestItems(String title) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.black.withOpacity(0.7)),
        child: Text(
          title,
          style: TextStyle(color: Colors.pink),
        ));
  }
}
