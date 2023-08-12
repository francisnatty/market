import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Crew extends StatefulWidget {
  const Crew({super.key});

  @override
  State<Crew> createState() => _CrewState();
}

class _CrewState extends State<Crew> {
  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: Column(
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
            addCrew(context)
          ],
        )),
      ),
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
