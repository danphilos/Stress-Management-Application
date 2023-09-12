
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:stress_management_app/utils/navigation.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:stress_management_app/widgets/button.dart';

class ManageStressScreen extends StatefulWidget {
  const ManageStressScreen({super.key});

  @override
  _ManageStressScreenState createState() => _ManageStressScreenState();
}

class _ManageStressScreenState extends State<ManageStressScreen> {
  bool _loading = true;
  bool isLoading = false;
  late File _image;
  List _output = [];
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel();
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
      _loading = false;
      isLoading = false;
    });

    if(output[0]['label'] == "1 Stressed"){
      moveToStressed();
    }

    if(output[0]['label'] == "0 Not stressed"){
      moveToNotStressed();
    }
  }

  //Loading the Model
  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  //Picking image via camera
  pickCameraImage() async {
    setState(() {
      isLoading = true;
    });
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }

    classifyImage(_image);

    setState(() {
      isLoading = false;
    });
  }

  //Picking Image via Gallary
  pickGalleryImage() async {
    setState(() {
      isLoading = true;
    });
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }

    classifyImage(_image);
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Stress', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
        elevation: 0,
        backgroundColor: kLeadBlack,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
              const Column(
                children: [
                  Text(
                    'Manage your Stress with the Power of AI',
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
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
                child: !isLoading
                  ? _loading
                    ? SizedBox(
                        child: Column(
                          children: <Widget>[
                            ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image.asset('assets/images/stress3.jpg')),
                          ],
                        ))
                    : SizedBox(
                      child: Column(
                        children: <Widget>[
                          ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image.file(_image, height: MediaQuery.of(context).size.height/3,)),
                          const SizedBox(height: 10),
                          Text(
                                  _output[0]['label'] == "0 Not stressed" ? 'Not Stressed' : 'Stressed',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    )
                    : preloader
              ),
              ],
            ),

            // The Buttons
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    CustomButton(onTap: pickCameraImage, text: "Capture"),
                    const SizedBox(height: 12,),
                    CustomButton(onTap: pickGalleryImage, text: "Gallery"),
                    const SizedBox(height: 24,),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
