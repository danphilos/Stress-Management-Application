
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stress_management_app/screens/recommendations.dart';
import 'package:stress_management_app/screens/settings.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:stress_management_app/widgets/button.dart';

class NotStressedScreen extends StatefulWidget {
  const NotStressedScreen({super.key});

  @override
  _NotStressedScreenState createState() => _NotStressedScreenState();
}

class _NotStressedScreenState extends State<NotStressedScreen> {

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
      appBar: AppBar(
        title: const Text('Not Stressed', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
        elevation: 0,
        backgroundColor: kLeadBlack,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            Text(
              'You are well today, Would you like to talk to a Therapist.',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 32,),

            CustomButton(onTap: (){}, text: "Sensations")
          ],
        ),
      ),
    );
  }
}
