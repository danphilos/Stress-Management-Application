import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:stress_management_app/utils/validator.dart';
import 'package:stress_management_app/widgets/button.dart';
import 'package:stress_management_app/screens/signup.dart';
import 'package:get/get.dart';
import 'package:stress_management_app/utils/wrapper.dart';
import 'package:stress_management_app/db/users_database.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  MindDatabase database = MindDatabase.instance;

  final storage = GetStorage();
  late String username = "";
  late String? email = "";
  bool _isLoading = false;
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  final _focusUsername = FocusNode();
  final _focusPassword = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;

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
      () => const Wrapper(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });
    try {
      if (_formKey.currentState!.validate()) {
      final loggedInUser = await database.logIn(_usernameController.text.trim(), _passwordController.text.trim());
      if (loggedInUser != null) {
        username = loggedInUser.username;
        email = loggedInUser.email;

        storage.write('profile', {
          "username": username,
          "email": email
        });
        moveToHome();
      } else {
        kDefaultDialog2("Failed", "Invalid username or password");
      }
      }
    } catch (error) {
      kDefaultDialog2("Error", "$error");
    }

    

    setState(() {
      _isLoading = false;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          _focusUsername.unfocus();
          _focusPassword.unfocus();
        },
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
                      key: _formKey,
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
                                  style: TextStyle(color: Colors.white),
                                  cursorColor: Colors.white,
                                controller: _usernameController,
                                focusNode: _focusUsername,
                                validator: (value) =>
                                    Validator.validateUsername(
                                  username: value,
                                ),
                                decoration: inputDecorationConst.copyWith(
                                  labelText: "username",
                                )
                                )
                              ]
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Password',
                                  style: kNunitoSansSemiBold18,
                                ),
                                const SizedBox(height: 4),
                                TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  cursorColor: Colors.white,
                                controller: _passwordController,
                                obscureText: !_showPassword,
                                focusNode: _focusPassword,
                                validator: (value) =>
                                    Validator.validatePassword(
                                  password: value,
                                ),
                                decoration: inputDecorationConst.copyWith(
                                  labelText: "password",
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: GestureDetector(
                                      onTap: _togglePasswordVisibility,
                                      child: SvgPicture.asset(
                                        _showPassword
                                            ? "assets/icons/password_invisible.svg"
                                            : "assets/icons/password_visible.svg",
                                        height: 15,
                                        width: 20,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.white, BlendMode.srcIn),
                                      ),
                                    ),
                                  ),
                                  suffixIconConstraints:
                                      const BoxConstraints(maxWidth: 50),
                                )
                                ),
                                const SizedBox(
                        height: 22,
                      ),
                      CustomButton(onTap: _signIn, text: _isLoading ? "Loading" : "Sign in",),
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