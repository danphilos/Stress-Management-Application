
import 'package:flutter/material.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:stress_management_app/utils/theme_dropdown.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  _ThemeScreenState createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {

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
        title: const Text('Theme', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
        elevation: 0,
        backgroundColor: kLeadBlack,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: const Column(
          children: [
            Row(
              children: [
                Text(
                  "Set the app's appearance.",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                ThemeDropdown(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
