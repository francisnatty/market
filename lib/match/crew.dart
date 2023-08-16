import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Crew extends StatefulWidget {
  const Crew({super.key});

  @override
  State<Crew> createState() => _CrewState();
}

class _CrewState extends State<Crew> {
  TextEditingController controller = TextEditingController();
  final pref = SharedPreferences.getInstance();
  String countryValue = '';
  String? first;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller;
  }

  List<String> items = ['Honesty', 'Calmness', 'loving and caring'];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  static Future setData(value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString('name', value);
  }

  static Future getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('name');
  }

  @override
  Widget build(BuildContext context) {
    controller.text = countryValue;
    // String? first = preferences!.getString('value1');
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            'Crews',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ))
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              myCrew(),
              const Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
              otherCrew(),
              const Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
              otherCrew(),
              const Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/dark.jpeg'),
                    ),
                  ),
                  Expanded(
                      child: ListTile(
                          title: Text(
                            'Philip',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          subtitle: Text(
                            'SENT YOU AN INVITE',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.grey),
                          ),
                          trailing: Container(
                            width: MediaQuery.of(context).size.width / 4,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(30)),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Respond',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )))
                ],
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
              addCrew(context),
              const Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
              SizedBox(
                height: 10,
              ),
              // qualityContainer(),
              Text(
                'What qualities do you need in your match?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              SizedBox(
                height: 10,
              ),
              // Expanded(
              //   child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       shrinkWrap: true,
              //       itemCount: items.length + 1,
              //       itemBuilder: (context, index) {
              //         if (index == items.length) {
              //           return Container(
              //             decoration: BoxDecoration(
              //                 color: Colors.grey.withOpacity(0.2),
              //                 borderRadius: BorderRadius.circular(10)),
              //             child: TextButton(
              //               child: Text(
              //                 'add',
              //                 style: TextStyle(color: Colors.black),
              //               ),
              //               onPressed: () {
              //                 bottomSheet(context);
              //               },
              //             ),
              //           );
              //         }
              //         return Container(
              //             decoration: BoxDecoration(
              //                 color: Colors.pink,
              //                 borderRadius: BorderRadius.circular(20)),
              //             child: TextButton(
              //                 onPressed: () {
              //                   dialog(context);
              //                 },
              //                 child: Text(
              //                   'Honesty',
              //                   style: TextStyle(color: Colors.white),
              //                 )));
              //       }),
              // ),
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                          onPressed: () {
                            dialog(context);
                          },
                          child: Text(
                            'Honesty',
                            style: TextStyle(color: Colors.white),
                          ))),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                          onPressed: () {
                            dialog(context);
                          },
                          child: Text(
                            'Loving',
                            style: TextStyle(color: Colors.white),
                          ))),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                          onPressed: () {
                            dialog(context);
                          },
                          child: Text(
                            'Loving and Caring',
                            style: TextStyle(color: Colors.white),
                          ))),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      child: Text(
                        'add',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        bottomSheet(context);
                      },
                    ),
                  ),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }

  Future<dynamic> dialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Text(
              ' Please Confirm again',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            actions: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Edit',
                    style: TextStyle(),
                  )),
              TextButton(onPressed: () {}, child: Text('Delete'))
            ],
          );
        });
  }

  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.black87,
        // shape: ShapeBorder.lerp(2, b, t),
        showDragHandle: true,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width,
              child: Container(
                child: Column(
                  children: [
                    qualityContainer(),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                            onPressed: () async {
                              try {
                                print('this is the data');
                                getData();
                                // String text = getData().toString();
                                // print('this is my ${text}');
                                // setData(controller.text);
                                // String text = controller.text;
                                // print(text);
                                // controller.clear();
                              } catch (e) {
                                print('exception');
                                print(e.toString());
                              }
                            },
                            child: Text(
                              'SUBMIT',
                              style: TextStyle(color: Colors.white),
                            )))
                  ],
                ),
              ),
            ),
          );
        });
  }

  Column qualityContainer() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
            child: Row(children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              onEditingComplete: () {},
              onChanged: (value) async {
                value = controller.text;
              },
              style: TextStyle(color: Colors.black45),
              decoration: InputDecoration(
                  labelText: 'Enter Qualities',
                  labelStyle: TextStyle(fontSize: 13, color: Colors.white),
                  // hintText: 'Enter qualities',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.pink)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.pink))),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ])),
      ],
    );
  }

  Row addCrew(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.fromBorderSide(BorderSide(
                      style: BorderStyle.solid, color: Colors.pink))),
              child: Icon(
                Iconsax.profile_add,
                color: Colors.pink,
                size: 25,
              )),
        ),
        Expanded(
            child: ListTile(
                title: Text(
                  'Setup Your',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text(
                  'Friends',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                trailing: Container(
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(30)),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Invite',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )))
      ],
    );
  }

  Row otherCrew() {
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/girltwo.jpg'),
          ),
        ),
        Expanded(
            child: ListTile(
          title: Text(
            'Monica\'s Crew',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            'Jennifer sent a photo',
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 14, color: Colors.grey),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.pink,
              )),
        ))
      ],
    );
  }

  Row myCrew() {
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/girl.jpg'),
          ),
        ),
        Expanded(
          child: ListTile(
            // hoverColor: Colors.red,
            // focusColor: Colors.red,
            // selectedTileColor: Colors.red,
            title: Text(
              'Your Crew',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Text(
              'Sarah:Hey guys how are you ',
              // style: TextStyle(fontWeight: FontWeight.w700),
            ),
            trailing: Container(
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.pink),
                child: Text(
                  '1',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )),
          ),
        ),
      ],
    );
  }
}
