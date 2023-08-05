import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:iconsax/iconsax.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Icon icon = Icon(Iconsax.heart);
  final iconLiked = Icon(Iconsax.heart5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Column(
          children: [
            topBar(context),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  posts(),
                  posts(),
                  posts(),
                ]),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Container topBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 8,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
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
                  color: Colors.white.withOpacity(0.1)),
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.qr_code_rounded)))
        ]),
      ),
    );
  }

  Container posts() {
    return Container(
      child: Column(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/girl.jpg'),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Monica',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  '@mmonica247',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Text(
              'Finding love is the best thing that can happen to an individual'),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/girl.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    icon = Icon(
                      Iconsax.heart5,
                      color: Colors.pink,
                    );
                  });
                },
                icon: icon),
            IconButton(
                onPressed: () {
                  showBottomSheet<void>(
                      backgroundColor: Colors.white,
                      enableDrag: true,
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 1.2,
                          child: Column(
                            children: [Text('My Name is Natty')],
                          ),
                        );
                      });
                },
                icon: Icon(Iconsax.message))
          ],
        ),
      ]),
    );
  }
}
