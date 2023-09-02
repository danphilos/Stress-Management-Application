
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:stress_management_app/widgets/button.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  bool _loading = true;

  //tflite varibles
  late File _image;
  List _output = [];
  //List<Map<String, dynamic>> _output = [];
  final picker = ImagePicker(); //Allows picking image from galler or camera

  @override
  void initState() {
    super.initState();
    loadModel();

    // .then((value) {
    //   setState(() {});
    // });
  }

  //Preprocessing the Image
  classifyImage(File image) async {
    dynamic output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.6,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _output = output;

      ///issues here
      _loading = false;
    });
  }

  //Loading the Model
  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  //Picking image via camera
  pickCameraImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }

    // setState(() {
    //   _image = File(image.path);
    // });

    classifyImage(_image);
  }

  //Picking Image via Gallary
  pickGalleryImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }

    // setState(() {
    //   _image = File(image.path);
    // });

    classifyImage(_image);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //Tflite.close();
    super.dispose();
  }

  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
              'Meditation',
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
            Container(
              height: MediaQuery.of(context).size.height - 250,
              child: ListView(
              children: const [
                Text(
              '1. Understand your pain',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '2. Lower your stress',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '3. Connect Better',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '4. Lower Anxiety',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '5. Improve focus',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '6. Reduce your brain',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10,),

              
              ]
            ),
            ),
            SizedBox(height: 50,),
                const Text(
              'Have you taken a Deep Breath',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
