import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileThree extends StatefulWidget {
  const ProfileThree({super.key});

  @override
  State<ProfileThree> createState() => _ProfileThreeState();
}

class _ProfileThreeState extends State<ProfileThree> {
  String selectedValue = 'Option 1';
  List<String> imagePaths = [
    'assets/girl.jpg',
    'assets/girltwo.jpg',
    'assets/dark.jpeg',
    'assets/girl.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/girl.jpg',
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 10, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Veronica, 20',
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 25),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: 15,
                        )
                      ],
                    ),
                    Text(
                      'Fashion Designer at Fashion Village',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Icon(
                          Iconsax.location,
                          color: Colors.pink,
                        ),
                        Text('69km away'),
                      ]),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'ABOUT ME',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Hey guys this is veronica,am here to find true love',
                      style: TextStyle(fontFamily: 'victor', fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'INTERESTS',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        interestItems('Fashion'),
                        SizedBox(
                          width: 10,
                        ),
                        interestItems('Singing'),
                        SizedBox(
                          width: 10,
                        ),
                        interestItems('Singing'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Text(
                      'MY PHOTOS',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                    ),
                    // GridView.builder(
                    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //       crossAxisCount: 2,
                    //       crossAxisSpacing: 8.0,
                    //       mainAxisSpacing: 8.0,
                    //     ),
                    //     itemCount: imagePaths.length,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       return Container(
                    //         child: ClipRRect(
                    //           borderRadius: BorderRadius.circular(20),
                    //           child: Image.asset(imagePaths[index]),
                    //         ),
                    //       );
                    //     })
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
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
          style: TextStyle(color: Colors.white),
        ));
  }
}
