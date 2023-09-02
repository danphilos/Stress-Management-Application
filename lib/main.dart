import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stress_management_app/screens/meditation.dart';
import 'package:stress_management_app/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:stress_management_app/screens/home.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';

void main() async {
  runApp(MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'mind.db'),

  //   onCreate: (db, version) {
  //   // Run the CREATE TABLE statement on the database.
  //   return db.execute(
  //     'CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, password TEXT)',
  //   );
  // },
  version: 1,
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Widget> _pages = [
    Home(),
    MeditationScreen()
  ];

  final RxInt _selectedIndex = 0.obs;

  void _onTabTapped(int index) {
    _selectedIndex.value = index;
  }

  bool shouldShowBottomNavBar(String route) {
    // List of routes where the bottom navigation bar should be visible
    final visibleRoutes = ['/home', '/profile', '/settings'];

    return visibleRoutes.contains(route);
  }

  @override
  Widget build (BuildContext context) {
    return GetMaterialApp(
      title: 'MindSuavie',
      home: MySplash(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "NunitoSans",
        scaffoldBackgroundColor: const Color(0xff101010),
      ),
    );
  }
}


