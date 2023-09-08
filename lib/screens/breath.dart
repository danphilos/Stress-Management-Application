
import 'package:flutter/material.dart';
import 'package:stress_management_app/utils/constants.dart';

class BreathScreen extends StatefulWidget {
  const BreathScreen({super.key});

  @override
  _BreathScreenState createState() => _BreathScreenState();
}

class _BreathScreenState extends State<BreathScreen> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breathing Exercise', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
        elevation: 0,
        backgroundColor: kLeadBlack,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            SizedBox(
                        child: Column(
                          children: <Widget>[
                            ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image.asset('assets/gifs/breathing-gif.gif')),
                          ],
                        )),

          ],
        ),
      ),
    );
  }
}
