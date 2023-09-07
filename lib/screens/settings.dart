import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stress_management_app/screens/about.dart';
import 'package:stress_management_app/utils/constants.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  void moveToSignup() {
    Get.to(
      () => const AboutScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 40),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
              'Settings',
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'Discover Happiness',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 40),
              ],
            ),

            InkWell(
              onTap: moveToSignup,
              child: Container(
                padding: const EdgeInsets.only(bottom: 16, top: 16),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info, color: kYellowHighlight, size: 32,),
                        SizedBox(width: 12,),
                        Text(
                          "About us",
                          style: kNunitoSansSemiBold18,
                        ),
                      ],
                    ),
                          
                    Icon(Icons.arrow_forward_ios, color: Colors.white,),
                  ],
                ),
              ),
            ),
              const SizedBox(
                    height: 16,
                  )
          ],
      ),
    );
  }
}