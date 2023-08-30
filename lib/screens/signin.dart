import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:stress_management_app/components/button.dart';
import 'package:stress_management_app/screens/signup.dart';
import 'package:get/get.dart';
import 'package:stress_management_app/screens/home.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  void moveToSignup() {
    Get.off(
      () => const SignUpScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  void moveToHome() {
    Get.off(
      () => const Home(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  Future<void> _signIn() async {
    try {
      moveToHome();
    } catch (error) {
      print(error);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){},
        child: SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    SvgPicture.asset("assets/logo.svg",
                          height: 80,
                          width: 50,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                        'Sign In',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
                      ),
                    const SizedBox(
                        height: 32,
                      ),
                    Form(
                      child: Column(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Username',
                                  style: kNunitoSansSemiBold18,
                                ),
                                const SizedBox(height: 4),
                                TextFormField(
                                  cursorColor: Colors.white,
                                // controller: _passwordController,
                                obscureText: true,
                                // focusNode: _focusPassword,
                                decoration: inputDecorationConst.copyWith(
                                  labelText: "username",
                                )
                                )
                              ]
                        ),
                        const SizedBox(height: 2),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Password',
                                  style: kNunitoSansSemiBold18,
                                ),
                                const SizedBox(height: 4),
                                TextFormField(
                                  cursorColor: Colors.white,
                                // controller: _passwordController,
                                obscureText: true,
                                // focusNode: _focusPassword,
                                decoration: inputDecorationConst.copyWith(
                                  labelText: "password",
                                )
                                ),
                                const SizedBox(
                        height: 22,
                      ),
                      CustomButton(onTap: _signIn, text: "Sign in"),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account,",
                            style: kNunitoSansSemiBold18.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: moveToSignup,
                            child: Text(
                              'SIGN UP',
                              style:
                                  kNunitoSansSemiBold18.copyWith(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                              ]
                        ),
                      ])
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}