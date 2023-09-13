import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stress_management_app/screens/about.dart';
import 'package:stress_management_app/screens/email_hr.dart';
import 'package:stress_management_app/screens/manage_stress.dart';
import 'package:stress_management_app/screens/meditation.dart';
import 'package:stress_management_app/screens/not_stressed.dart';
import 'package:stress_management_app/screens/play_song.dart';
import 'package:stress_management_app/screens/sensations.dart';
import 'package:stress_management_app/screens/signin.dart';
import 'package:stress_management_app/screens/signup.dart';
import 'package:stress_management_app/screens/stressed_screen.dart';
import 'package:stress_management_app/screens/theme.dart';
import 'package:stress_management_app/screens/therapist.dart';
import 'package:stress_management_app/utils/wrapper.dart';

void moveToSignup() {
  Get.off(
    () => const SignUpScreen(),
    transition: Transition.noTransition,
    duration: const Duration(milliseconds: 200),
    curve: Curves.easeOut,
  );
}

void moveToSignIn() {
  Get.off(
    () => const SignInScreen(),
    transition: Transition.cupertino,
    duration: const Duration(milliseconds: 600),
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
}

void moveToSensation() {
  Get.to(
    () => const SensationsScreen(),
    transition: Transition.cupertino,
    duration: const Duration(milliseconds: 600),
    curve: Curves.easeOut,
  );
}

void moveToTherepist() {
  Get.to(
    () => const TherapistScreen(),
    transition: Transition.cupertino,
    duration: const Duration(milliseconds: 600),
    curve: Curves.easeOut,
  );
}

void moveToMeditation() {
  Get.to(
    () => const MeditationScreen(),
    transition: Transition.cupertino,
    duration: const Duration(milliseconds: 600),
    curve: Curves.easeOut,
  );
}

void moveToManageStress() {
  Get.to(
    () => const ManageStressScreen(),
    transition: Transition.cupertino,
    duration: const Duration(milliseconds: 600),
    curve: Curves.easeOut,
  );
}

void moveToAbout() {
  Get.to(
    () => const AboutScreen(),
    transition: Transition.cupertino,
    duration: const Duration(milliseconds: 600),
    curve: Curves.easeOut,
  );
}

void moveToTheme() {
  Get.to(
    () => const ThemeScreen(),
    transition: Transition.cupertino,
    duration: const Duration(milliseconds: 600),
    curve: Curves.easeOut,
  );
}

void moveToNotStressed() {
  Get.to(
    () => const NotStressedScreen(),
    transition: Transition.cupertino,
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeOut,
  );
}

void moveToStressed() {
  Get.to(
    () => const StressedScreen(),
    transition: Transition.cupertino,
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeOut,
  );
}

void moveToPlaySong(source, name) {
  Get.to(
    () => PlaySong(source: source, name: name,),
    transition: Transition.cupertino,
    duration: const Duration(milliseconds: 600),
    curve: Curves.easeOut,
  );
}

void moveToEmail() {
  Get.to(
    () => const EmailHRScreen(),
    transition: Transition.cupertino,
    duration: const Duration(milliseconds: 600),
    curve: Curves.easeOut,
  );
}

