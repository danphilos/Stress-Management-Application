
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stress_management_app/screens/play_song.dart';
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
                  style: kNunitoSansSemiBold18,)
                ],
              ),

              const SizedBox(height: 16,),

              InkWell(
                onTap: (){
                  Get.to(
                    () => PlaySong(source: 'audio/tenderness.mp3', name: 'tenderness.mp3',),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeOut,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(bottom: 16, top: 16, left: 8, right: 8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: Colors.white30),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.play_circle, color: Colors.white,),
                      SizedBox(width: 12,),
                      Text(
                      'Tenderness - Bensounds',
                      style: TextStyle(color: Colors.white, fontSize: 20),),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8,),

              InkWell(
                onTap: (){
                  Get.to(
                    () => PlaySong(source: 'audio/slowmotion.mp3', name: 'slowmotion.mp3',),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeOut,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(bottom: 16, top: 16, left: 8, right: 8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: Colors.white30),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.play_circle, color: Colors.white,),
                      SizedBox(width: 12,),
                      Text(
                      'Slow Motion - Bensounds',
                      style: TextStyle(color: Colors.white, fontSize: 20),),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16,),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kYellow,
        onPressed: () {},
        child: const Icon(Icons.add), // Add an icon to the FAB
      ),
    );
  }
}
