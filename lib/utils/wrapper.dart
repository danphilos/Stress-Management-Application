
import 'package:flutter/material.dart';
import 'package:stress_management_app/screens/settings.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:stress_management_app/widgets/button.dart';
import 'package:get/get.dart';
import 'package:stress_management_app/screens/manage_stress.dart';
import 'package:stress_management_app/screens/meditation.dart';
import 'package:stress_management_app/screens/therapist.dart';
import 'package:stress_management_app/screens/sensations.dart';
import 'package:stress_management_app/screens/home.dart';
import 'package:stress_management_app/screens/profile.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
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
    Get.to(
      () => const ManageStressScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  void moveToMeditation() {
    Get.to(
      () => const MeditationScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  void moveToTherepist() {
    Get.to(
      () => const TherapistScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  void moveToSensation() {
    Get.to(
      () => const SensationsScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }


  final List<Widget> _pages = const [
    Home(),
    Profile(),
    Settings()
  ];

  final RxInt _selectedIndex = 0.obs;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex.value = index;
    });
  }

  bool shouldShowBottomNavBar(String route) {
    // List of routes where the bottom navigation bar should be visible
    final visibleRoutes = ['/home', '/profile', '/settings'];

    return visibleRoutes.contains(route);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _pages[_selectedIndex.value],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex.value,
        onTap: _onTabTapped,
        backgroundColor: Colors.black,
        unselectedItemColor: Color.fromARGB(150, 255, 255, 255),
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      )
    );
  }
}
