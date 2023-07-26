import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class BannerItem extends StatelessWidget {
  final AppBanner appBanner;
  const BannerItem({super.key, required this.appBanner});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage(appBanner.image), fit: BoxFit.cover),
      ),
      child: DefaultTextStyle(
          style: TextStyle(color: Colors.black, fontSize: 20.0),
          child: Stack(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
              ),
              Center(
                  child: Column(
                children: <Widget>[
                  Text(appBanner.title.toUpperCase()),
                  Text(appBanner.id.toString().toUpperCase())
                ],
              ))
            ],
          )),
    );
  }
}
