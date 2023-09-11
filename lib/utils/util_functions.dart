import 'package:get_storage/get_storage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stress_management_app/db/users_database.dart';
import 'package:stress_management_app/models/user.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:stress_management_app/utils/navigation.dart';


MindDatabase database = MindDatabase.instance;
final storage = GetStorage();

void logInUser(formKey, usernameController, passwordController, username, email, alreadyLoggedIn) async {
  try {
    if (formKey.currentState!.validate()) {
      final loggedInUser = await database.logIn(usernameController.text.trim(), passwordController.text.trim());
      if (loggedInUser != null) {
        username = loggedInUser.username;
        email = loggedInUser.email;

        storage.write('profile', {
          "username": username,
          "email": email
        });
        alreadyLoggedIn();
      } else {
        kDefaultDialog2("Failed", "Invalid username or password");
      }
    }
  } catch (error) {
    kDefaultDialog2("Error", "$error");
  }
}

void signUpUser(formKey, usernameController, passwordController, emailController,) async {
  try {
      if (formKey.currentState!.validate()) {
        final newUser = User(username: usernameController.text.trim(), password: passwordController.text.trim(), email: emailController.text.trim());
        final loggedInUser = await database.signUp(newUser);

      if (loggedInUser != null) {
        kDefaultDialog("Successful", "Continue to Home", onYesPressed: (){
          storage.write('profile', {
            "username": usernameController.text.trim(),
            "email": emailController.text.trim()
          });
          moveToHome();
          });
      } else {
        kDefaultDialog2("Failed", "Something went wrong, Try again");
      }
      }
    } catch (error) {
      kDefaultDialog2("Error", "$error");

      if (error is DatabaseException && error.isUniqueConstraintError()) {
        kDefaultDialog2("Username is not unique", "Please choose another username");
      } else {
        kDefaultDialog2("Error", "$error");
      }
    }
}

