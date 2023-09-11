import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stress_management_app/db/users_database.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:stress_management_app/utils/navigation.dart';
import 'package:stress_management_app/utils/util_functions.dart';
import 'package:stress_management_app/utils/validator.dart';
import 'package:stress_management_app/widgets/button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  MindDatabase database = MindDatabase.instance;
  bool _isLoading = false;
  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _focusUsername = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;

  final storage = GetStorage();

  Future<void> _signUp() async {
    setState(() {
      _isLoading = true;
    });
    
    signUpUser(_formKey, _usernameController, _passwordController, _emailController);

    setState(() {
      _isLoading = false;
    });
  
  }

  @override
  void initState() {
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          _focusUsername.unfocus();
          _focusEmail.unfocus();
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
                        'Sign Up for MindSuavie',
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
                                  style: const TextStyle(color: Colors.white),
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
                                  'Email',
                                  style: kNunitoSansSemiBold18,
                                ),
                                const SizedBox(height: 4),
                                TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  cursorColor: Colors.white,
                                controller: _emailController,
                                focusNode: _focusEmail,
                                validator: (value) =>
                                    Validator.validateEmail(
                                  email: value,
                                ),
                                decoration: inputDecorationConst.copyWith(
                                  labelText: "email",
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
                      CustomButton(onTap: _signUp, text: _isLoading ? "loading..." : "Get Started"),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account,",
                            style: kNunitoSansSemiBold18.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: moveToSignIn,
                            child: Text(
                              'SIGN IN',
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