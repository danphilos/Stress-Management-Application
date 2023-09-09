import 'package:get_storage/get_storage.dart';
import 'package:stress_management_app/db/users_database.dart';
import 'package:stress_management_app/utils/constants.dart';


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