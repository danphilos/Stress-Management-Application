import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


//colors
const kLeadBlack = Color(0xff1F1F1F);
const kModelBlack = Color(0xff2D2E33);
const kYellow = Color(0xffe99600);
const kYellowHighlight = Color.fromARGB(255, 245, 168, 25);


// text
const kNunitoSansSemiBold18 = TextStyle(
  fontFamily: "NunitoSans",
  fontSize: 17,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

const kNunitoSans16 = TextStyle(
  fontFamily: "NunitoSans",
  fontSize: 17,
  color: Colors.white,
);

/// Simple preloader inside a Center widget
const preloader = Center(child: CircularProgressIndicator(color: Colors.white));

// input field
const inputDecorationConst = InputDecoration(
  isDense: true,
  floatingLabelBehavior: FloatingLabelBehavior.never,
  labelStyle:
      TextStyle(fontFamily: "NunitoSans", color: Colors.grey, fontSize: 16),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: Colors.white),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white), // Set the border color to white
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: Colors.grey),
  ),
   hintStyle: TextStyle(color: Colors.white),
  //  style: TextStyle(color: Colors.white),
  prefixStyle: TextStyle(color: Colors.white),
  suffixStyle: TextStyle(color: Colors.white),
  counterStyle: TextStyle(color: Colors.white),
  helperStyle: TextStyle(color: Colors.white),
);


// pop up
Future kDefaultDialog(String title, String message,
    {VoidCallback? onYesPressed}) async {
  if (GetPlatform.isIOS) {
    await Get.dialog(
      CupertinoAlertDialog(
        title: Text(title),
        content: Text(message, style: const TextStyle(color: Colors.white)),
        actions: [
          if (onYesPressed != null)
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                Get.back();
              },
              child: const Text(
                "Cancel",
              ),
            ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: onYesPressed,
            child: Text(
              (onYesPressed == null) ? "Ok" : "Yes",
            ),
          ),
        ],
      ),
    );
  } else {
    await Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(message, style: const TextStyle(color: Colors.white)),
        actions: [
          if (onYesPressed != null)
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
          TextButton(
            onPressed: (onYesPressed == null)
                ? () {
                    Get.back();
                  }
                : onYesPressed,
            child: Text(
              (onYesPressed == null) ? "Ok" : "Yes",
              style: const TextStyle(
                color: Color(0xFFE99600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// pop up
Future kDefaultDialog2(String title, String message) async {
  if (GetPlatform.isIOS) {
    await Get.dialog(
      CupertinoTheme(
        data: const CupertinoThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blue, // Change the background color.
      textTheme: CupertinoTextThemeData(
        primaryColor: Colors.white, // Change the text color.
      ),
    ),
        child: CupertinoAlertDialog(
          title: Text(title),
          content: Text(message, style: const TextStyle(color: Colors.white)),
          actions: [
            // if (onYesPressed != null)
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                Get.back();
              },
              child: const Text(
                "Okay",
              ),
            ),
          ],
        ),
      ),
    );
  } else {
    await Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(message, style: const TextStyle(color: Colors.white),),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "Okay",
              style: TextStyle(
                color: Color(0xFFE99600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}