
import 'package:flutter/material.dart';

class SensationsScreen extends StatefulWidget {
  const SensationsScreen({super.key});

  @override
  _SensationsScreenState createState() => _SensationsScreenState();
}

class _SensationsScreenState extends State<SensationsScreen> {

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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: const Column(
          children: <Widget>[
            SizedBox(height: 40),
            Column(
              children: [
                Text(
              'Sensations',
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
