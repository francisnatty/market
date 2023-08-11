import 'package:flutter/material.dart';

class MyTopSheet extends StatefulWidget {
  const MyTopSheet({super.key});

  @override
  State<MyTopSheet> createState() => _MyTopSheetState();
}

class _MyTopSheetState extends State<MyTopSheet> {
  bool _isTopSheetOpen = false;
  void _toggleTopSheet() {
    setState(() {
      _isTopSheetOpen = !_isTopSheetOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To sheet Example')),
      body: Column(children: [
        _isTopSheetOpen
            ? SizedBox.shrink()
            : ElevatedButton(onPressed: _toggleTopSheet, child: Text('Button')),
        if (_isTopSheetOpen)
          Container(
            height: 300,

            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                color: Colors.blue),
            child: Center(
                child: Column(
              children: [
                Text('My Top sheet header'),
                TextButton(
                    onPressed: () {
                      // Navigator.pop(context);
                      _isTopSheetOpen = false;
                    },
                    child: Text('close'))
              ],
            )),

            //top sheet content goes here
          ),
        Expanded(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text('Top sheet Content'),
                SizedBox(
                  height: 100,
                ),
                Text('Top sheet Content'),
              ],
            ),
          ),
        )),
        Positioned(
            left: 0,
            right: 0,
            top: _isTopSheetOpen ? 0 : -300,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: _isTopSheetOpen ? 300 : 0,
              child: Container(
                child: Text('Top sheet'),
              ),
            ))
      ]),
    );
  }
}
