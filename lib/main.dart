import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stress_management_app/db/users_database.dart';
import 'package:stress_management_app/models/user.dart';
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
    // MindDatabase._createDB()
    onCreate: (db, version) async {
      // _createDB(db, version);
      final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final usernameType = 'TEXT NOT NULL UNIQUE';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE "users" ( 
  ${UserFields.id} $idType, 
  ${UserFields.username} $usernameType,
  ${UserFields .password} $textType
  )
''');
    },
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
        scaffoldBackgroundColor: const Color(0xff1F1F1F),
      ),
    );
  }
}


