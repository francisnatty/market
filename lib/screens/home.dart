import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  final _controller = TextEditingController();
  bool seeAcctBal = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: customNav(),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              child: Stack(children: [
                Container(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          shape: BoxShape.circle),
                      child: IconButton(
                        icon: Icon(Iconsax.notification),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          'assets/notificationbell.jpg',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Hello,Natty',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black87,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Your balance',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        seeAcctBal
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    seeAcctBal = false;
                                  });
                                },
                                icon: Icon(
                                  Icons.visibility_off_outlined,
                                  color: Colors.white,
                                ),
                              )
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    seeAcctBal = true;
                                    ;
                                  });
                                },
                                icon: Icon(
                                  Icons.visibility_outlined,
                                  color: Colors.white,
                                ),
                              )
                      ],
                    ),
                    Text(
                      seeAcctBal ? '\NGN 3,460,348' : '*****',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Colors.lightGreen,
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Dollar Acct',
                          style: TextStyle(color: Colors.white),
                        ))
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                columnFunctionWidget(
                    'Add Money',
                    Colors.purpleAccent.shade200,
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
                columnFunctionWidget(
                    'Transfer',
                    Colors.brown.shade300,
                    Icon(
                      Iconsax.send1,
                      color: Colors.white,
                    )),
                columnFunctionWidget(
                    'Withdraw',
                    Colors.blueAccent,
                    Icon(
                      Iconsax.arrow_down_2,
                      color: Colors.white,
                    )),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Pay bills',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(
              color: Colors.lightGreen,
              thickness: 1,
            ),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    billsRow(
                        'Airtime',
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                    billsRow(
                        'Data',
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                    billsRow(
                        'Electricity',
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                    billsRow(
                        'Cable TV',
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                    billsRow(
                        'WAEC',
                        Icon(
                          Icons.cast_for_education,
                          color: Colors.white,
                        )),
                  ]),
            ),
            const Divider(
              color: Colors.green,
              thickness: 1,
            ),
            const SizedBox(),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(Iconsax.user_add)),
                  title: Text(
                    'Refer Friends and Earn',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Earn 500 per referral',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                ListTile(
                  leading: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(Iconsax.user_add)),
                  title: Text(
                    'Become an Agent?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Create a business acct now',
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }

  Widget billsRow(String title, Icon icon) {
    return Column(
      children: [
        Column(children: [
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black.withOpacity(0.8)),
              child: IconButton(
                onPressed: () {},
                icon: icon,
              )),
          Text(
            title,
          ),
        ]),
      ],
    );
  }

  Widget columnFunctionWidget(
    String title,
    Color color,
    Icon icon,
  ) {
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.height / 8,
        width: MediaQuery.of(context).size.width / 3.6,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            icon,
            Text(
              title,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget customNav() {
    return Drawer(
      child: Column(children: [
        Container(
          child: Column(children: [
            Center(
              child: const UserAccountsDrawerHeader(
                accountEmail: Text('fff'),
                accountName: Text('Natty'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/notificationbell.jpg'),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ]),
            ),

            // Container(
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(100),
            //     child: Image.asset(
            //       'assets/notificationbell.jpg',
            //       width: 80,
            //       height: 80,
            //     ),
            //   ),
            // ),
            // Text(
            //   'Hi,natty',
            //   textAlign: TextAlign.start,
            //   style: TextStyle(),
            // ),
            // const Divider(
            //   thickness: 1,
            // ),

            // const Divider(
            //   thickness: 1,
            // ),
          ]),
        )
      ]),
    );
  }
}
