
import 'package:flutter/material.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:stress_management_app/widgets/button.dart';

class SensationsScreen extends StatefulWidget {
  const SensationsScreen({super.key});

  @override
  _SensationsScreenState createState() => _SensationsScreenState();
}

class _SensationsScreenState extends State<SensationsScreen> {

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
        title: const Text('Sensations', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
        elevation: 0,
        backgroundColor: kLeadBlack,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: <Widget>[
            Column(
              children: [
            const SizedBox(height: 24),

            const Row(
              children: [
                Text(
                  'Kill Anxiety, ',
                  style: TextStyle(color: Colors.white, fontSize: 20),),
                  Text(
                  'Stay Calm',
                  style: TextStyle(color: Colors.white, fontSize: 20),),
              ],
            ),

              const SizedBox(height: 15,),

              ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image.asset('assets/stress3.jpg')),

              const SizedBox(height: 24,),

              const Row(
                children: [
                  Text(
                  'Playlist by Immie',
                  style: TextStyle(color: Colors.white, fontSize: 20),),
                ],
              ),

              const SizedBox(height: 16,),

              const Row(
                children: [
                  Icon(Icons.play_circle, color: Colors.white,),
                  SizedBox(width: 12,),
                  Text(
                  'Hello - By Adele',
                  style: TextStyle(color: Colors.white, fontSize: 20),),
                ],
              ),
              const SizedBox(height: 4,),
              const Row(
                children: [
                  Icon(Icons.play_circle, color: Colors.white,),
                  SizedBox(width: 12,),
                  Text(
                  'Stay so - By Busy Signal',
                  style: TextStyle(color: Colors.white, fontSize: 20),),
                ],
              ),

              const SizedBox(height: 16,),

              CustomButton(onTap: (){}, text: "Add Music",),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
