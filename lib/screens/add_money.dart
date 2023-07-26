import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddMoneyScreen extends StatefulWidget {
  const AddMoneyScreen({super.key});

  @override
  State<AddMoneyScreen> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          columnWidget(
              'Top-Up with card', 'add money to your acct with your bank card'),
          SizedBox(
            height: 15,
          ),
          columnWidget('Agent', 'let our agents help you to fund your acct'),
          SizedBox(
            height: 15,
          ),
          columnWidget('Request From Others',
              'Make cash requests from friends and family')
        ]),
      )),
    );
  }

  Container columnWidget(String titleText, String subtitleText) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
      child: ListTile(
        leading: Icon(Iconsax.wallet5),
        title: Text(
          titleText,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitleText,
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
