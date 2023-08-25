
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:stress_management_app/components/button.dart';

class ManageStressScreen extends StatefulWidget {
  const ManageStressScreen({super.key});

  @override
  _ManageStressScreenState createState() => _ManageStressScreenState();
}

class _ManageStressScreenState extends State<ManageStressScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(height: 40),
            Column(
              children: [
                const Text(
              'Manage your Stress with the Power of AI',
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              'Help us Understand you better by taking a Clear Photo using your front Camera',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              child: _loading
                  ? SizedBox(
                      width: 500,
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/stress3.jpg'),
                        ],
                      ))
                  : Column(
                    children: <Widget>[
                      Image.file(_image),
                      const SizedBox(height: 20),
                      Text(
                              '${_output[0]['label']}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                      const SizedBox(height: 10),
                    ],
                  ),
            ),
              ],
            ),
            const SizedBox(height: 50,),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    CustomButton(onTap: pickCameraImage, text: "Capture"),
                    const SizedBox(height: 12,),
                    CustomButton(onTap: pickGalleryImage, text: "Gallery")
                  ],
                ))
          ],
        ),
      ),
    );
  }
}