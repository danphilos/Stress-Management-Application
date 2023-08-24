import 'package:flutter/material.dart';
import 'package:stress_management_app/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      title: 'MindSuavie',
      home: const MySplash(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "NunitoSans",
        scaffoldBackgroundColor: const Color(0xff101010),
      ),
    );
  }
}


