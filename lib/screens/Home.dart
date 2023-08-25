
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:stress_management_app/components/button.dart';
import 'package:get/get.dart';
import 'package:stress_management_app/screens/manage_stress.dart';
import 'package:stress_management_app/screens/meditation.dart';
import 'package:stress_management_app/screens/therapist.dart';
import 'package:stress_management_app/screens/sensations.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  void moveToManageStress() {
    Get.off(
      () => const ManageStressScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  void moveToMeditation() {
    Get.off(
      () => const MeditationScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  void moveToTherepist() {
    Get.off(
      () => const TherapistScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  void moveToSensation() {
    Get.off(
      () => const SensationsScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(height: 30),
            const Column(
              children: [
                Text(
              'Are you an employee having stress at work. need someone to talk to?',
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            SizedBox(height: 40),
              ],
            ),
            const SizedBox(height: 50,),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    CustomButton(onTap: moveToManageStress, text: "Manage Stress"),
                    const SizedBox(height: 12,),
                    CustomButton(onTap: moveToTherepist, text: "Talk to a Therapist"),
                    const SizedBox(height: 12,),
                    CustomButton(onTap: moveToMeditation, text: "Meditation"),
                    const SizedBox(height: 12,),
                    CustomButton(onTap: moveToSensation, text: "Sensations")
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
