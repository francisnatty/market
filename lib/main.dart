import 'package:flutter/material.dart';
import 'package:market/UserProfile/edit.dart';
import 'package:market/screens/home.dart';
import 'package:market/screens/my_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        dividerColor: Colors.blue,
        primaryColor: Colors.blue,
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        // textTheme: TextTheme()
      ),
      //  home: const CustomBottomNav(),
      initialRoute: 'navbar',

      routes: {
        'navbar': (context) => CustomBottomNav(),
        'edit': (context) => EditScreen(),
      },
    );
  }
}
