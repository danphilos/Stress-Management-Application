
import 'package:flutter/material.dart';
import 'package:stress_management_app/widgets/button.dart';
import 'package:get/get.dart';
import 'package:stress_management_app/screens/manage_stress.dart';
import 'package:stress_management_app/screens/meditation.dart';
import 'package:stress_management_app/screens/therapist.dart';
import 'package:stress_management_app/screens/sensations.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void moveToManageStress() {
    Get.to(
      () => const ManageStressScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  void moveToMeditation() {
    Get.to(
      () => const MeditationScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  void moveToTherepist() {
    Get.to(
      () => const TherapistScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  void moveToSensation() {
    Get.to(
      () => const SensationsScreen(),
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(height: 16),
            const Column(
              children: [
                Text(
              'Are you an employee having stress at work. need someone to talk to?',
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            SizedBox(height: 40),
              ],
            ),
            const SizedBox(height: 50,),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    CustomButton(onTap: moveToManageStress, text: "Manage Stress"),
                    const SizedBox(height: 12,),
                    CustomButton(onTap: moveToTherepist, text: "Talk to a Therapist"),
                    const SizedBox(height: 12,),
                    CustomButton(onTap: moveToMeditation, text: "Meditation"),
                    const SizedBox(height: 12,),
                    CustomButton(onTap: moveToSensation, text: "Sensations"),
                    const SizedBox(height: 12,),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
