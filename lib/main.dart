import 'package:advance_ui_daliy_task/screens/dielogPage/dielogPage.dart';
import 'package:advance_ui_daliy_task/screens/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>homePage(),
     '/dielog':(context)=>dielog()
      },
    );
  }
}
