import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:market/UserProfile/edit.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final controller = PageController(initialPage: 1);
  List<String> images = [
    'assets/girl.jpg',
    'assets/girltwo.jpg',
    '',
    '',
    '',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'My Profile',
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Iconsax.edit,
                color: Colors.pink,
              ),
              onPressed: () {
                bottomSheet(context);
                // Navigator.pushNamed(context, 'edit');
              },
            ),
          ],
          // leading: IconButton(
          //   icon: Icon(
          //     Icons.arrow_back_ios,
          //     color: Colors.pink,
          //   ),
          //   onPressed: () {},
          // )
        ),
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/girl.jpg',
                fit: BoxFit.cover,
              ),
              ClipRRect(
                child: BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
              // Align(
              //   alignment: Alignment.topRight,
              //   child: Container(
              //     padding: EdgeInsets.all(10),
              //     child: Container(
              //         padding: EdgeInsets.all(10),
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20),
              //             color: Colors.white.withOpacity(0.7)),
              //         child: IconButton(
              //           icon: Icon(
              //             Iconsax.edit,
              //           ),
              //           onPressed: () {
              //             Navigator.of(context).push(MaterialPageRoute(
              //                 builder: (context) => EditScreen()));
              //             // Navigator.pushNamed(context, 'edit');
              //           },
              //         )),
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: GestureDetector(
              //     onTap: () {
              //       Navigator.of(context).push(
              //           MaterialPageRoute(builder: (context) => EditScreen()));
              //     },
              //     child: Container(
              //       padding: EdgeInsets.all(3),
              //       child: Container(
              //           padding: EdgeInsets.all(10),
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(20),
              //               color: Colors.white.withOpacity(0.7)),
              //           child: IconButton(
              //             icon: Icon(Icons.arrow_back_ios),
              //             onPressed: () {
              //               Navigator.of(context).push(MaterialPageRoute(
              //                   builder: (context) => EditScreen()));
              //             },
              //           )),
              //     ),
              //   ),
              // ),
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
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.2,
                    //width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
                    child: Stack(
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              'assets/girl.jpg',
                              // height: MediaQuery.of(context).size.height,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 0.0,
                          right: 0.0,
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
                                    Row(
                                      children: [
                                        Text(
                                          'Veronica,',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          ' 21',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
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
                                        Text('5km away')
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  aboutUser(),

                  Container(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      //padding: EdgeInsets.all(20),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('assets/girltwo.jpg'),
                      ),
                    ),
                  ),
                  interests(),

                  // aboutUser(),
                ]),
              )
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
            color: Colors.white.withOpacity(0.9)),
        child: Column(children: [
          Text(
            'About Me',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Divider(
            color: Colors.pink,
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
              Text('Senior Developer at Google'),
            ],
          ),
          SizedBox(
            height: 5,
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
              Text('Male'),
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
          Row(
            children: [
              Icon(
                Iconsax.location,
                color: Colors.pink,
              ),
              SizedBox(
                width: 20,
              ),
              Text('Minna'),
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
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Interests',
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

  PersistentBottomSheetController<void> bottomSheet(BuildContext context) {
    return showBottomSheet<void>(
        enableDrag: true,
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'PHOTOS LIBRARY',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.builder(
                        itemCount: images.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, mainAxisSpacing: 4),
                        itemBuilder: ((context, index) {
                          String image = images[index];
                          return Container(
                              // padding: EdgeInsets.all(20),
                              child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  icon: image.isNotEmpty
                                      ? Icon(
                                          Iconsax.close_square,
                                          color: Colors.pink,
                                        )
                                      : SizedBox.shrink(),
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                  // padding: EdgeInsets.all(5),
                                  height:
                                      MediaQuery.of(context).size.height / 6,
                                  width: MediaQuery.of(context).size.width / 5,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: image.isNotEmpty
                                        ? Image.asset(
                                            images[index],
                                            fit: BoxFit.cover,
                                          )
                                        : IconButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditScreen()));
                                            },
                                            icon: Icon(
                                              Iconsax.add_circle,
                                              color: Colors.pink,
                                            )),
                                  )),
                            ],
                          ));
                        })),
                  ),
                ])),
          );
        });
  }

  Container interestItems(String title) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.black.withOpacity(0.7)),
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ));
  }
}
