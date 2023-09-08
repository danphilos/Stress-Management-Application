import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stress_management_app/screens/signin.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:stress_management_app/utils/wrapper.dart';

class MySplash extends StatefulWidget { 
  const MySplash({Key? key}) : super(key: key);
  
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State <MySplash> {
  final storage = GetStorage();
  late Map<dynamic, dynamic>? profileMap = storage.read('profile');
  late String username = profileMap?['username'] ?? "";
  late String email = profileMap?['email'] ?? "";

  

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((_) {
      if (profileMap != null) {
        if (username.isEmpty) {
          Get.off(() => const SignInScreen(), transition: Transition.fadeIn);
        } else {
          Get.off(() => const Wrapper(), transition: Transition.fadeIn);
        }
      } else {
        Get.off(() => const SignInScreen(), transition: Transition.fadeIn);
      }
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

    
    
    
    
