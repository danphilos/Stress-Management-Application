
// ignore: file_names
// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; //This line ensures that File variable has no error

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: prefer_final_fields
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
      backgroundColor: Color(0xff101010),
      body: Container(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: duplicate_ignore
          children: <Widget>[
            SizedBox(height: 85),
            Text(
              'Manage your Stress with the Power of AI',
              style: TextStyle(color: Color(0xffeeda28), fontSize: 28),
            ),
            SizedBox(height: 6),
            const Text(
              'Help us Understand you better by taking a Clear Photo using your front Camera',
              style: TextStyle(
                color: Color(0xffe99600),
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(height: 40),
            Center(
              child: _loading
                  ? Container(
                      width: 500,
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/stress3.jpg'),
                          SizedBox(height: 250),
                        ],
                      ))
                  : Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 250,
                            child: Image.file(_image),
                          ),
                          SizedBox(height: 20),
                          _output != null
                              ? Text(
                                  '${_output[0]['label']}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              : Container(),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: pickCameraImage,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 150,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                        decoration: BoxDecoration(
                          color: Color(0xffe99600),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text('Capture',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: pickGalleryImage,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 150,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                        decoration: BoxDecoration(
                          color: Color(0xffe99600),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text('Gallery',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
