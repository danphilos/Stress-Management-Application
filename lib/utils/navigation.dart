import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stress_management_app/screens/signup.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:stress_management_app/utils/wrapper.dart';

void moveToSignup() {
  Get.off(
    () => const SignUpScreen(),
    transition: Transition.noTransition,
    duration: const Duration(milliseconds: 200),
    curve: Curves.easeOut,
  );
}

void moveToHome() {
  Get.off(
    () => const Wrapper(),
    transition: Transition.cupertino,
    duration: const Duration(milliseconds: 600),
    curve: Curves.easeOut,
  );
  // context.showSnackBar(
  //   message: 'Signed in',
  //   backgroundColor: kModelBlack,
  // );
}