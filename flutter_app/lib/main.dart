import 'package:flutter/material.dart';
import 'package:stress_management_app/splashscreen.dart';
import 'package:page_transition/page_transition.dart';
//import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //This widget is the root of your application

  @override
  Widget build (BuildContext context) {
    return const MaterialApp(
      title: 'MindSuavie',
      home: MySplash(),
      debugShowCheckedModeBanner: false,
    );
  }
}


