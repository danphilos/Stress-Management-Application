import 'package:flutter/material.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:stress_management_app/utils/navigation.dart';
import 'package:stress_management_app/widgets/button.dart';
import 'package:lottie/lottie.dart';


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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Lottie.asset(
                  'assets/stress_anim.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const Text(
              'You are well today, Would you like to talk to a Therapist.',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
              ],
            ),


            const Column(
              children: [
                CustomButton(onTap: moveToTherepist, text: "Talk to a therapist"),
                SizedBox(height: 16,),
                CustomButton(onTap: moveToSensation, text: "Sensations")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
