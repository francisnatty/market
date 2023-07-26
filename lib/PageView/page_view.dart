import 'package:flutter/material.dart';
import 'package:market/PageView/banner_item.dart';
import 'package:market/PageView/model.dart';

class PageViewer extends StatefulWidget {
  const PageViewer({super.key});

  @override
  State<PageViewer> createState() => _PageViewerState();
}

class _PageViewerState extends State<PageViewer> {
  int? selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          height: 160.0,
          decoration: BoxDecoration(),
          child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              itemCount: appList.length,
              itemBuilder: ((context, index) {
                return BannerItem(appBanner: appList[index]);
              })),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                appList.length,
                (index) =>
                    indicator(isActive: selectedIndex == index ? true : false)),
          ],
        )
      ]),
    );
  }
}

class indicator extends StatelessWidget {
  final bool isActive;
  const indicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isActive ? 22.0 : 8.0,
      duration: const Duration(milliseconds: 350),
      margin: EdgeInsets.all(5),
      height: 8.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isActive ? Colors.orange : Colors.grey),
    );
  }
}
