
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:stress_management_app/widgets/song_card.dart';
import 'package:file_picker/file_picker.dart';


class SensationsScreen extends StatefulWidget {
  const SensationsScreen({super.key});

  @override
  _SensationsScreenState createState() => _SensationsScreenState();
}

class _SensationsScreenState extends State<SensationsScreen> {

  List<File> audioFiles = [];

  Future<void> pickAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: true,
    );

    if (result != null) {
      List<File> pickedFiles = result.paths.map((path) => File(path!)).toList();

      setState(() {
        audioFiles.addAll(pickedFiles);
      });
    }
  }


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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
      
                    ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image.asset('assets/images/stress3.jpg')),
      
                    const SizedBox(height: 24,),
      
                    const Row(
                      children: [
                        Text(
                        'Playlist by Immie',
                        style: kNunitoSansSemiBold18,)
                      ],
                    ),
      
                    
      
                    const SizedBox(height: 16,),
                    const SongCard('audio/tenderness.mp3', 'tenderness.mp3'),
                    const SizedBox(height: 8,),
                    const SongCard('audio/slowmotion.mp3', 'slowmotion.mp3'),
                    const SizedBox(height: 16,),
                    ],
                  ),
                ],
              ),
            ),
            // Container(
            //   height: 400,
            //   child: ListView.builder(
            //             itemCount: audioFiles.length,
            //             itemBuilder: (context, index) {
            //               return ListTile(
            //                 title: Text(audioFiles[index].path.split('/').last), // Display file name
            //               );
            //             },
            //           ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kYellow,
        onPressed: () {
          pickAudio();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
