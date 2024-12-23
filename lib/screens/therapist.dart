
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:stress_management_app/widgets/Calendar.dart';
import 'package:stress_management_app/widgets/meeting_link.dart';

class TherapistScreen extends StatefulWidget {
  const TherapistScreen({super.key});

  @override
  _TherapistScreenState createState() => _TherapistScreenState();
}

class _TherapistScreenState extends State<TherapistScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Talk To a Therapist', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
        elevation: 0,
        backgroundColor: kLeadBlack,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: <Widget>[
            Column(
              children: [
                const SizedBox(height: 40),

                Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: const BorderRadius.all(Radius.circular(8))
                        ),
                        child: const Text(
                        'New Meeting',
                        style: TextStyle(color: Colors.white, fontSize: 20),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32,),

                  InkWell(
                    onTap: () {
                  Get.to(
                    () => const MeetingLink(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 16, top: 16),
                      child: const Row(
                        children: [
                          Icon(Icons.video_call, color: Colors.white,),
                          SizedBox(width: 12,),
                          Text(
                          'Start an instant meeting',
                          style: TextStyle(color: Colors.white, fontSize: 20),),
                        ],
                      ),
                    ),
                  ),

              InkWell(
                onTap: () {
                  Get.to(
                    () => const MeetingLink(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(bottom: 16, top: 16),
                  child: const Row(
                    children: [
                      Icon(Icons.link, color: Colors.white,),
                      SizedBox(width: 12,),
                      Text(
                      'Get a meeting link to share',
                      style: TextStyle(color: Colors.white, fontSize: 20),),
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Get.to(
                    () => const WebViewApp(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(bottom: 16, top: 16),
                  child: const Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.white,),
                      SizedBox(width: 12,),
                      Text(
                      'Schedule in Google Calendar',
                      style: TextStyle(color: Colors.white, fontSize: 20),),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28,),
              const Row(
                children: [
                  SizedBox(width: 12,),
                  Text(
                  'Your Therapist',
                  style: TextStyle(color: Colors.white, fontSize: 20),),
                ],
              ),
              const Row(
                children: [
                  SizedBox(width: 12,),
                  Text(
                  'james@gmail.com',
                  style: TextStyle(color: Colors.white, fontSize: 20),),
                ],
              ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
