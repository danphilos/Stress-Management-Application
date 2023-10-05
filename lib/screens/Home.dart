
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stress_management_app/utils/navigation.dart';
import 'package:stress_management_app/widgets/button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final storage = GetStorage();
  late Map profileMap = storage.read('profile');
  late String username = profileMap['username'] ?? "";

  String capitalize(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  const SizedBox(height: 16,),
                  Row(
                    children: [
                      Text(
                        'Hello, ${capitalize(username)}!',
                        style: const TextStyle(color: Colors.white70, fontSize: 20,),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  const Text(
                    'Are you an employee having stress at work. need someone to talk to?',
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                        child: Column(
                          children: <Widget>[
                            ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image.asset('assets/images/stress3.jpg')),
                          ],
                        ))
                ],
              ),

              

              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Column(
                    children: <Widget>[
                      CustomButton(onTap: moveToManageStress, text: "Manage Stress"),
                      SizedBox(height: 12,),
                      CustomButton(onTap: moveToTherepist, text: "Talk to a Therapist"),
                      SizedBox(height: 12,),
                      CustomButton(onTap: moveToMeditation, text: "Meditation"),
                      SizedBox(height: 12,),
                      CustomButton(onTap: moveToSensation, text: "Sensations"),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
