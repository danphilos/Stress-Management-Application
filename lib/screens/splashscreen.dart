import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stress_management_app/screens/Home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';


class MySplash extends StatefulWidget { 
  const MySplash({Key? key}) : super(key: key);
  
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State <MySplash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      
      //splash: Icons.home,
      
      splash: const Column(
        children: [
          //Image.asset('assets/stress3.jpg'),
          Text(
            'MindSuavie',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color(0xffe99600),
            ),
          ),
           SizedBox(height: 10),
          Text(
            'feel the moment',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Color(0xffe99600),
            ),
          ),
           
          
        ],
      ),
     
        
      splashTransition: SplashTransition.decoratedBoxTransition,
      pageTransitionType: PageTransitionType.fade,
      animationDuration: const Duration(seconds: 2),
      nextScreen: Home(),
      //backgroundColor: Colors.black,
    );

  }
}

    
    
    
    
