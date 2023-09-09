
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stress_management_app/screens/settings.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:stress_management_app/widgets/button.dart';

class RecommendationScreen extends StatefulWidget {
  const RecommendationScreen({super.key});

  @override
  _RecommendationScreenState createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {

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
        title: const Text('Recommendations', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
        elevation: 0,
        backgroundColor: kLeadBlack,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Try these solutions',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 32,),

            SizedBox(
              height: MediaQuery.of(context).size.height/3,
              child: ListView(
              children: const [
                Text(
              '1. Say no to work outside your roles',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '2. Clarify your roles and expectations',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '3. Go for travels, shows and swimming during the weekend',
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
              ]
            ),),
            
            const SizedBox(height: 16,),
            Row(
              children: [
                Text("Need to talk to someone", style: TextStyle(color: Colors.white, fontSize: 20),),
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                  'Email HR',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 4,),
                    OutlineButton(onTap: (){
                      Get.back();
                    }, text: "Send"),
                  ],
                ),
                const SizedBox(width: 4,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                  'Schedule',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                    Text(
                  'meeting',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 4,),
                    OutlineButton(onTap: (){
                      Get.to(
                        () => const RecommendationScreen(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOut,
                      );
                    }, text: "Submit"),
                  ],
                ),
                
              ],
            ),
            const SizedBox(height: 32,),
            CustomButton(onTap: (){}, text: "Sensations")
          ],
        ),
      ),
    );
  }
}
