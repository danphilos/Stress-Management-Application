
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stress_management_app/screens/screens.dart';
import 'package:stress_management_app/utils/constants.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: kLeadBlack,
      systemNavigationBarColor: kModelBlack
      ),
    );
    return Scaffold(
      body: Obx(
        () => _pages[_selectedIndex.value],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 8, top: 8),
        color: const Color(0xff2D2E33),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: _selectedIndex.value,
          onTap: _onTabTapped,
          backgroundColor: const Color(0xff2D2E33),
          unselectedItemColor: const Color.fromARGB(150, 255, 255, 255),
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
        ),
      )
    );
  }
}
