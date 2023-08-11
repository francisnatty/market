import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';
import 'package:iconsax/iconsax.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  bool isTopSheetOpen = false;
  List<dynamic> myPosts = [
    {
      'name': 'Monica',
      'username': '@monica247',
      'title': 'Hi guys,am monica i would love to know you more',
      'image': 'assets/girl.jpg'
    },
    {
      'name': 'Philip',
      'username': '@philip34',
      'title': 'cute ladies,like my picture..hahaha',
      'image': 'assets/dark.jpeg'
    },
    {
      'name': 'Philip',
      'username': '@philip34',
      'title': 'cute ladies,like my picture..hahaha',
      'image': 'assets/dark.jpeg'
    },
    {
      'name': 'Jessica',
      'username': '@jessica34',
      'title': 'hi guys,i stay at miami,Florida i am 25years old',
      'image': 'assets/girltwo.jpg'
    }
  ];
  List<dynamic> comments = [
    {
      'image': 'assets/girl.jpg',
      'name': 'Monica Martins',
      'comments': 'Very pretty'
    },
    {
      'image': 'assets/girltwo.jpg',
      'name': 'Jessica Joseph',
      'comments': 'so lovely',
    },
    {
      'image': 'assets/dark.jpeg',
      'name': 'Matthew John',
      'comments': 'You look very pretty pls chat me up',
    },
    {
      'image': 'assets/dark.jpeg',
      'name': 'Philp Chris',
      'comments': 'Pls Can we be Friends',
    },
    {
      'image': 'assets/girl.jpg',
      'name': 'Monica Martins',
      'comments': 'Very pretty'
    },
    {
      'image': 'assets/girltwo.jpg',
      'name': 'Jessica Joseph',
      'comments': 'so lovely',
    },
    {
      'image': 'assets/dark.jpeg',
      'name': 'Matthew John',
      'comments': 'You look very pretty pls chat me up',
    },
    {
      'image': 'assets/dark.jpeg',
      'name': 'Philp Chris',
      'comments': 'Pls Can we be Friends',
    }
  ];

  void toggleTopSheet() {
    setState(() {
      isTopSheetOpen = !isTopSheetOpen;
    });
  }

  //Icon icon = Icon(Iconsax.heart);
  IconData icon = Iconsax.heart;
  IconData iconLiked = Iconsax.heart5;
  bool IsIconClicked = false;
  bool isUserCommented = true;
  double? sliderValue = 23.0;
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            child: SafeArea(
              child: Stack(children: <Widget>[
                Column(
                  children: [
                    isTopSheetOpen
                        ? SizedBox.shrink()
                        : topBar(context, tabController),
                    isTopSheetOpen
                        ? Container(
                            //  height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Colors.grey.withOpacity(0.1),
                            ),
                            child: topSheetColumn(context, tabController))
                        : CarouselSlider.builder(
                            itemCount: myPosts.length,
                            itemBuilder: (context, index, realIndex) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                                child: SizedBox(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  child: Container(
                                    height: 50,
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.fromBorderSide(
                                            BorderSide(color: Colors.grey))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              'A journey of love',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 21),
                                            ),
                                            Text(
                                              'Starts with a simple',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 21),
                                            ),
                                            Text(
                                              'Swipe away',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 21),
                                            ),
                                          ],
                                        ),
                                        ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            child: Image.asset(
                                              'assets/girl.jpg',
                                              // height: 50,
                                              //scale: 1.0,
                                              fit: BoxFit.cover,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                                autoPlay: false,
                                enlargeCenterPage: true,
                                aspectRatio: 2.0,
                                viewportFraction: 0.9),
                          ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: myPosts.length,
                          itemBuilder: (context, index) {
                            return posts(
                                myPosts[index]['image'],
                                myPosts[index]['name'],
                                myPosts[index]['title'],
                                myPosts[index]['username']);
                          }),
                    ),
                  ],
                ),
              ]),
            ),
            value: SystemUiOverlayStyle.light
                .copyWith(statusBarColor: Colors.pink)));
  }

  Container topBar(BuildContext context, TabController controller) {
    return Container(
      height: MediaQuery.of(context).size.height / 11,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.pink,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Row(children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                // bottomSheet2(context, controller);
                toggleTopSheet();
              },
              child: Material(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Friends'),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Icon(Iconsax.arrow_down_1)
                      ],
                    ),
                  )),
            ),
          ),
          SizedBox(
            width: 15,
          ),
        ]),
      ),
    );
  }

  Container posts(String image, String name, String title, String username) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(image),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Iconsax.clock4,
                      size: 12,
                    ),
                    Text(
                      ' 3hrs ago',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'hi guys i stay at Los Angeles,chat me up',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          IsIconClicked = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.1)),
                        padding: EdgeInsets.all(6),
                        child: Container(
                          child: Row(children: [
                            IsIconClicked
                                ? Icon(
                                    iconLiked,
                                    color: Colors.pink,
                                    size: 17,
                                  )
                                : Icon(
                                    icon,
                                    size: 17,
                                  ),
                            SizedBox(
                              width: 5,
                            ),
                            IsIconClicked
                                ? Text(
                                    'Liked',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  )
                                : Text(
                                    '20',
                                    style: TextStyle(fontSize: 12),
                                  )
                          ]),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        bottomSheet();
                        //showTopModalSheet(context, names());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.1)),
                        padding: EdgeInsets.all(6),
                        child: Container(
                          child: Row(children: [
                            isUserCommented
                                ? Icon(
                                    Iconsax.message_2, color: Colors.pink,
                                    size: 17,
                                    //  color: Colors.pink,
                                  )
                                : Icon(Iconsax.message_2),
                            SizedBox(
                              width: 5,
                            ),
                            isUserCommented ? SizedBox.shrink() : Text('20'),
                            SizedBox(
                              width: 5,
                            ),
                            isUserCommented
                                ? Text(
                                    'Commented',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  )
                                : Text(
                                    'Comments',
                                    style: TextStyle(fontSize: 12),
                                  )
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        //   child: Text(
        //     title,
        //     textAlign: TextAlign.left,
        //   ),
        // ),

        const Divider(
          color: Colors.grey,
          thickness: 0.5,
        )
      ]),
    );
  }

  Container names() {
    return Container(
      color: Colors.white,
      child: Text('My name is natty'),
    );
  }

  bottomSheet() {
    return showModalBottomSheet<void>(
        backgroundColor: Colors.white,
        enableDrag: true,
        showDragHandle: true,
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(
                      //   'Reactions',
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold),
                      // ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Comments',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text('40'),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: [
                              Icon(
                                Iconsax.heart5,
                                color: Colors.pink,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  '20',
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         // borderRadius:
                      //         //     BorderRadius.circular(10),
                      //         shape: BoxShape.circle,
                      //         color: Colors.grey.withOpacity(0.1)),
                      //     child: IconButton(
                      //       icon: Icon(
                      //         Iconsax.close_square,
                      //         color: Colors.pink,
                      //       ),
                      //       onPressed: () {
                      //         Navigator.pop(context);
                      //       },
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.pink,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.pink.withOpacity(0.1)),
                                child: ListTile(
                                  leading: CircleAvatar(
                                      backgroundImage:
                                          AssetImage(comments[index]['image'])),
                                  title: Text(
                                    comments[index]['name'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    comments[index]['comments'],
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        }),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey.withOpacity(0.2),
                            child: Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Add comment',
                                      border: InputBorder.none,
                                      //labelText: 'Add Comment',
                                      hintStyle: TextStyle(fontSize: 12)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Iconsax.send1))
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  //  tabContainer(controller),

  Container tabContainer(TabController controller) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: Colors.pink)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: TabBar(
          indicatorColor: Colors.pink,
          isScrollable: true,
          // indicator: BoxDecoration(
          //     border: Border.fromBorderSide(
          //       BorderSide(
          //         color: Colors.pink,
          //       ),
          //     ),
          //     borderRadius: BorderRadius.circular(20)),
          controller: controller,
          // labelStyle: TextStyle(color: Colors.pink),
          labelColor: Colors.pink,
          // indicatorSize: TabBarIndicatorSize.tab,
          // splashBorderRadius: BorderRadius.circular(40),
          tabs: [
            Tab(
              text: 'Friends',
            ),
            Tab(
              text: 'Flirt',
            ),
            Tab(
              text: 'Relationship',
            ),
            Tab(
              text: 'Marriage',
            ),
          ]),
    );
  }

  bottomSheet2(BuildContext context, TabController controller) {
    return showModalBottomSheet<void>(
        backgroundColor: Colors.white,
        context: context,
        enableDrag: true,
        showDragHandle: true,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return topSheetColumn(context, controller);
        });
  }

  Column topSheetColumn(BuildContext context, TabController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'QUICK FILTERS',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            tabContainer(controller),
            Expanded(
                child: TabBarView(
              controller: controller,
              children: [
                friendsTab(),
                tabTwo(),
                tabThree(),
                tabFour(),
              ],
            )),
            TextButton(
              onPressed: () {
                setState(() {
                  isTopSheetOpen = false;
                });
              },
              child: Text(
                'Close',
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            )
          ]),
        ),
      ],
    );
  }

  Container tabThree() {
    return filters();
  }

  Container friendsTab() {
    return filters();
  }

  Container filters() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Age',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Slider(
              autofocus: true,
              activeColor: Colors.pink,
              // mouseCursor: MaterialStateMouseCursor(),
              min: 20,
              max: 100,
              divisions: 1,
              value: sliderValue!,
              label: sliderValue!.round().toString(),
              onChanged: (double newValue) {
                setState(() {
                  sliderValue = newValue;
                });
              }),
          Text(
            'Location',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(color: Colors.pink)),
                borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: double.infinity,
              child: Row(
                  children: [Icon(Icons.location_on), Text('London,England')]),
            ),
          )
        ],
      ),
    );
  }

  Container tabTwo() {
    return filters();
  }

  Container tabFour() {
    return filters();
  }
}
