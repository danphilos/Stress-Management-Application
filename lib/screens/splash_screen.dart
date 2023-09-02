import 'package:flutter/material.dart';
import 'package:stress_management_app/screens/signin.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MySplash extends StatefulWidget { 
  MySplash({Key? key}) : super(key: key);
  
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State <MySplash> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      Get.off(() => const SignInScreen(), transition: Transition.fadeIn);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/logo.svg", height: 100,
                          width: 100,),
                          const SizedBox(height: 10,),
            const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                    'Mind',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Suavie',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Color(0xffFEBF00),
                    ),
                  ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'feel the moment',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
            
          ],
        ),
      ),
    );

  }
}

    
    
    
    
