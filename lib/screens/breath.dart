
import 'package:flutter/material.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:stress_management_app/widgets/button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class BreathScreen extends StatefulWidget {
  const BreathScreen({super.key});

  @override
  _BreathScreenState createState() => _BreathScreenState();
}

class _BreathScreenState extends State<BreathScreen> with TickerProviderStateMixin {

late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Exercise duration
    );
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

            // AnimatedBuilder(
            //   animation: _controller,
            //   builder: (context, child) {
            //     return DefaultTextStyle(
            //       style: TextStyle(
            //         fontSize: 48.0,
            //         fontWeight: FontWeight.bold,
            //       ),
            //       child: Center(
            //         child: AnimatedTextKit(
            //           animatedTexts: [
            //             ScaleAnimatedText('Inhale',),
            //             ScaleAnimatedText('Hold',),
            //             ScaleAnimatedText('Exhale',),
            //             ScaleAnimatedText('Hold',),
            //           ],
            //           onTap: () {
            //             if (_controller.isAnimating) {
            //               _controller.stop();
            //             } else {
            //               _controller.reset();
            //               _controller.forward();
            //             }
            //           },
            //         ),
            //       ),
            //     );
            //   },
            // ),

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
