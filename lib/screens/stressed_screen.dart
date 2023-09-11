
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stress_management_app/screens/recommendations.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:stress_management_app/widgets/button.dart';

class StressedScreen extends StatefulWidget {
  const StressedScreen({super.key});

  @override
  _StressedScreenState createState() => _StressedScreenState();
}

class _StressedScreenState extends State<StressedScreen> {

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
        title: const Text('Stressed', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
        elevation: 0,
        backgroundColor: kLeadBlack,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            const Text(
              'It looks like you are stressed, could theses have caused the stress.',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 32,),
            const Row(
              children: [
                Text(
                  'Tick where applicable:',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineButton(onTap: (){
                  Get.back();
                }, text: "Cancel"),
                const SizedBox(width: 4,),
                SmallButton(onTap: (){
                  Get.to(
                    () => const RecommendationScreen(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeOut,
                  );
                }, text: "Submit"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
