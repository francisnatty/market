import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';
import 'package:iconsax/iconsax.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
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
                    topBar(context, tabController),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                          height: 100,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: myPosts.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 20,
                                    height: 50,
                                    //decoration: Image(image: DecorationImage()),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset(
                                        myPosts[index]['image'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              })),
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
      height: MediaQuery.of(context).size.height / 9,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.pink,
        // borderRadius: BorderRadius.only(
        //     bottomLeft: Radius.circular(20),
        //     bottomRight: Radius.circular(20))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(children: <Widget>[
          Expanded(
            child: Material(
              //  elevation: 5.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                cursorColor: Colors.pink,
                decoration: const InputDecoration(
                    hintText: 'People,Places and Businesses',
                    hintStyle: TextStyle(color: Colors.black38, fontSize: 16),
                    prefixIcon: Material(
                      elevation: 0.0,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      child: Icon(Iconsax.search_favorite),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white.withOpacity(0.5)),
              child: IconButton(
                  onPressed: () {
                    bottomSheet2(context, controller);
                  },
                  icon: Icon(Icons.qr_code_rounded)))
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
                        // bottomSheet();
                        showTopModalSheet(context, names());
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

  PersistentBottomSheetController<void> bottomSheet() {
    return showBottomSheet<void>(
        backgroundColor: Colors.white,
        enableDrag: true,
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                              // borderRadius:
                              //     BorderRadius.circular(10),
                              shape: BoxShape.circle,
                              color: Colors.grey.withOpacity(0.1)),
                          child: IconButton(
                            icon: Icon(
                              Iconsax.close_square,
                              color: Colors.pink,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      )
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

  PersistentBottomSheetController<void> bottomSheet2(
      BuildContext context, TabController controller) {
    return showBottomSheet<void>(
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 3,
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
              ))
            ]),
          );
        });
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
