import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stress_management_app/screens/signin.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:stress_management_app/widgets/button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final storage = GetStorage();
  late Map profileMap = storage.read('profile');
  late String username = profileMap['username'] ?? "";
  late String email = profileMap['email'] ?? "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 40),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
              'Profile',
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'Manage Your Account',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 40),
              ],
            ),

            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Name",
                    style: kNunitoSansSemiBold18,
                  ),
                  Text(
                    username,
                    style: kNunitoSans16,
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Email",
                    style: kNunitoSansSemiBold18,
                  ),
                  Text(
                    email,
                    style: kNunitoSans16,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),

              CustomButton(onTap: (){
                
                kDefaultDialog(
                  "Sign out",
                  "Are you sure you want to sign out?",
                  onYesPressed: () {
                    Get.offAll(const SignInScreen());
                    storage.remove('profile');
                  },
                );


              }, text: "Sign Out",),
          ],
      ),
    );
  }
}