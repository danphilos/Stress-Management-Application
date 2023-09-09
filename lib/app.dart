import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:stress_management_app/screens/splash_screen.dart';
import 'package:stress_management_app/utils/constants.dart';

class MindSuavieApp extends StatelessWidget {
  const MindSuavieApp({super.key});

  @override
  Widget build (BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: kLeadBlack),
    );
    return GetMaterialApp(
      title: 'MindSuavie',
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "NunitoSans",
        dialogBackgroundColor: kModelBlack,
        scaffoldBackgroundColor: kLeadBlack,
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}