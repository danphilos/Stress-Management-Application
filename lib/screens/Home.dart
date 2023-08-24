
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:stress_management_app/components/button.dart';

class Home extends StatefulWidget {
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

  //@override
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
              style: TextStyle(color: Color(0xffeeda28), fontSize: 28),
            ),
            const SizedBox(height: 6),
            const Text(
              'Help us Understand you better by taking a Clear Photo using your front Camera',
              style: TextStyle(
                color: Color(0xffe99600),
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              color: Colors.green,
              child: _loading
                  ? Container(
                      width: 500,
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/stress3.jpg'),
                        ],
                      ))
                  : Container(
                      child: Column(
                        children: <Widget>[
                          Image.file(_image),
                          const SizedBox(height: 20),
                          _output != null
                              ? Text(
                                  '${_output[0]['label']}',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              : Container(),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
            ),
              ],
            ),
            const SizedBox(height: 50,),
            Container(
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
