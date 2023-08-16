import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  bool isCheckBoxOpen1 = false;
  bool isCheckBoxOpen2 = false;
  bool isCheckboxOpen3 = false;
  bool isPopUpOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      // backgroundColor: Colors.white.withOpacity(0.8),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            // fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: isPopUpOpen
                        ? SizedBox.shrink()
                        : Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              // border: Border.fromBorderSide(
                              //     BorderSide(color: Colors.pink, width: 2))
                            ),
                            padding: EdgeInsets.all(8.0),
                            height: MediaQuery.of(context).size.height / 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: SizedBox(
                                          height: 70,
                                          width: 70,
                                          child: CircleAvatar(
                                            radius: 48,
                                            backgroundImage:
                                                AssetImage('assets/girl.jpg'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text('Matching for'),
                                          Text(
                                            'Yourself',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ]),
                                PopupMenuButton(
                                  color: Colors.white,
                                  icon: Icon(
                                    Icons.arrow_drop_down_circle_outlined,
                                    color: Colors.pink,
                                  ),
                                  constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width),
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Matching for?',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(
                                              Iconsax.close_square,
                                              color: Colors.pink,
                                            ))
                                      ],
                                    )),
                                    PopupMenuItem(
                                      // mouseCursor: Colors.purple,
                                      value: 1,
                                      child: popItem(context, 'YourSelf',
                                          'assets/girl.jpg', isCheckBoxOpen1),
                                    ),
                                    // PopupMenuDivider();
                                    PopupMenuItem(
                                      child: popItem(
                                          context,
                                          'Lauren',
                                          'assets/girltwo.jpg',
                                          isCheckBoxOpen2),
                                      value: 2,
                                    ),
                                    PopupMenuItem(
                                      child: popItem(context, 'Philip',
                                          'assets/dark.jpeg', isCheckboxOpen3),
                                      value: 3,
                                    ),
                                    PopupMenuItem(
                                        child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(8, 5, 8, 5),
                                        decoration: BoxDecoration(
                                            // borderRadius: BorderRadius.circular(20),
                                            // color: Colors.pink.withOpacity(0.1)
                                            ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(children: [
                                                  SizedBox(
                                                    height: 50,
                                                    width: 50,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border
                                                              .fromBorderSide(
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .pink))),
                                                      child: Icon(
                                                        Iconsax.profile_add,
                                                        color: Colors.pink,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Set Your',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        'Friends up',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ]),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: Colors.black87),
                                                  child: TextButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      'Invite',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            const Divider(
                                              thickness: 0.5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height / 1.5,
                            width: double.infinity,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('assets/girl.jpg'),
                                      fit: BoxFit.cover)),
                            )),
                      ),
                      Positioned(
                          bottom: 5,
                          left: 5,
                          right: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 9.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white.withOpacity(0.7)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Monica ,24',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_city_outlined,
                                            color: Colors.pink,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('Product Designer')
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.school_sharp,
                                            color: Colors.pink,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                              'Federal university of Technology Minna')
                                        ],
                                      )
                                    ]),
                              ),
                            ),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.clear,
                                color: Colors.red,
                                size: 40,
                              ))),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 7,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Iconsax.heart5,
                            color: Colors.green,
                            size: 40,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox popItem(
      BuildContext context, String title, String image, bool checkValue) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(20),
            // color: Colors.pink.withOpacity(0.1)
            ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(backgroundImage: AssetImage(image)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ]),
                Checkbox(
                    activeColor: Colors.pink,
                    // checkColor: Colors.pink,
                    value: checkValue,
                    onChanged: (value) {
                      setState(() {
                        checkValue = value!;
                      });
                    }),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            const Divider(
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
