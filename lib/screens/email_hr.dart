
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stress_management_app/db/users_database.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:stress_management_app/utils/validator.dart';
import 'package:stress_management_app/widgets/button.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailHRScreen extends StatefulWidget {
  const EmailHRScreen({super.key});

  @override
  _EmailHRScreenState createState() => _EmailHRScreenState();
}

class _EmailHRScreenState extends State<EmailHRScreen> {
  MindDatabase database = MindDatabase.instance;
  final storage = GetStorage();
  late Map profileMap = storage.read('profile');
  late String username = profileMap['username'] ?? "";
  late String email = profileMap['email'] ?? "";

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _focusPassword = FocusNode();
  final _focusEmail = FocusNode();
  final _formKey = GlobalKey<FormState>();

  Future<void> _sendEmail() async {
    // String useremail = '';
    // String password = '';

    final smtpServer = gmail(email, _passwordController.text.trim());

    final message = Message()
    ..from = Address(email, username)
    ..recipients.add('kasasiracharles01@gmail.com')
    ..subject = 'MindSuavie: $username'
    ..text = _emailController.text.trim()
    ..html = _emailController.text.trim();

    try {
    final sendReport = await send(message, smtpServer);
    context.showSnackBar(
      message: 'Message sent: ' + sendReport.toString(),
      backgroundColor: kModelBlack,
    );
  } on MailerException catch (e) {
    context.showSnackBar(
      message: 'Message not sent',
      backgroundColor: kModelBlack,
    );
    print("nah: $e");
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Email', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
        elevation: 0,
        backgroundColor: kLeadBlack,
      ),
      body: GestureDetector(
        onTap: () {
          print("you");
          _focusEmail.unfocus();
          _focusPassword.unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                    Form(
                      key: _formKey,
                      child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'From: ',
                                      style: kNunitoSansSemiBold18,
                                    ),
                                    const SizedBox(width: 4),
                                Container(
                                  padding: const EdgeInsets.only(bottom: 4, top: 4, left: 8, right: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade700,
                                    borderRadius: BorderRadius.circular(24)
                                  ),
                                  child: Text(
                                    email,
                                    style: kNunitoSansSemiBold18,
                                  ),
                                ),
                                  ],
                                ),
                                
                              ]
                        ),
                        const SizedBox(height: 16,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  maxLines: 5,
                                  style: const TextStyle(color: Colors.white),
                                  cursorColor: Colors.white,
                                  controller: _emailController,
                                  focusNode: _focusEmail,
                                  decoration: inputDecorationConst.copyWith(
                                    labelText: "",
                                  )
                                )
                              ]
                        ),
                        const SizedBox(height: 16,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Password to confirm',
                                  style: kNunitoSansSemiBold18,
                                ),
                                const SizedBox(height: 4),
                                TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  cursorColor: Colors.white,
                                  controller: _passwordController,
                                obscureText: true,
                                focusNode: _focusPassword,
                                  validator: (value) =>
                                      Validator.validatePassword(
                                    password: value,
                                  ),
                                  decoration: inputDecorationConst.copyWith(labelText: "password"),
                                ),
                        ]),

                        const SizedBox(height: 24,),
                        CustomButton(onTap: _sendEmail, text: "Submit")
                      ],
                    )),
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
