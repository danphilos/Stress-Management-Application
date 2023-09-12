
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stress_management_app/screens/breath.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:stress_management_app/widgets/button.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meditation', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
        elevation: 0,
        backgroundColor: kLeadBlack,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(
                    'Discover happiness',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 40),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 250,
              child: ListView(
              children: const [
                Text(
              '1. Understand your pain',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '2. Lower your stress',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '3. Connect Better',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '4. Improve focus',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '5. Reduce your brain',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10,),
              ]
            ),),

            CustomButton(onTap: () {
              Get.to(
                () => const BreathScreen(),
                transition: Transition.cupertino,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOut,
              );
            }, text: "Try the Breathing Exercise"),
          ],
        ),
      ),
    );
  }
}
