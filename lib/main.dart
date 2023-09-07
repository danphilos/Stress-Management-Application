import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stress_management_app/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:stress_management_app/utils/constants.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build (BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: kLeadBlack),
    );
    return GetMaterialApp(
      title: 'MindSuavie',
      home: const MySplash(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "NunitoSans",
        dialogBackgroundColor: kModelBlack,
        scaffoldBackgroundColor: kLeadBlack,
        textTheme: const TextTheme(
          headline6: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
