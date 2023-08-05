import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    double cardHeight = MediaQuery.of(context).size.height / 5;
    return Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.2),
        body: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              clipBehavior: Clip.none,
              fit: StackFit.loose,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(color: Colors.lightGreen),
                ),
                Positioned(
                  top: 110,
                  left: 50,
                  right: 50,
                  child: Container(
                    // width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        //SizedBox(height: cardHeight / 2),
                        Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  'assets/notificationbell.jpg',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Okpe Francis Nathaniel',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '61736241** Fidelity',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: cardHeight / 3.5,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      children: [
                        profileListile(
                            'Transaction History',
                            'Keep track of your transactions',
                            Icon(Iconsax.transaction_minus)),
                        const Divider(
                          thickness: 1,
                        ),
                        profileListile(
                          'Security',
                          'Payment Pin',
                          Icon(Iconsax.security),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        profileListile(
                          'Bank Verification',
                          'verify your info',
                          Icon(Iconsax.bank),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        profileListile(
                          'Terms and Condition',
                          'Read our terms and condition',
                          Icon(Iconsax.security),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('See More'),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      children: [
                        profileListile(
                          'Contact us',
                          'Payment Pin',
                          Icon(Iconsax.call),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        profileListile(
                          'Logout',
                          '',
                          Icon(Iconsax.logout),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  ListTile profileListile(
    String title,
    String subtitle,
    Icon leading,
  ) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey, fontSize: 10),
      ),
      leading: leading,
      trailing: Container(
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20),
          //     // shape: BoxShape.circle,
          //     color: Colors.grey.withOpacity(0.2)),
          child: IconButton(
        onPressed: () {},
        icon: Icon(
          Iconsax.forward5,
          size: 15,
        ),
      )),
    );
  }
}
