
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stress_management_app/screens/settings.dart';
import 'package:stress_management_app/widgets/button.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void moveToSignup() {
    Get.off(
      () => const Settings(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28,)),
                    const Text(
              'About Us',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
                  ],
                ),
            const SizedBox(height: 6),
            const SizedBox(height: 40),

              const SizedBox(height: 15,),
              const SizedBox(height: 16,),

              const SizedBox(height: 16,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
