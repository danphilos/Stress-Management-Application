import 'package:flutter/material.dart';

// text
const kNunitoSansSemiBold18 = TextStyle(
  fontFamily: "NunitoSans",
  fontSize: 17,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

// input field
const inputDecorationConst = InputDecoration(
  isDense: true,
  floatingLabelBehavior: FloatingLabelBehavior.never,
  labelStyle:
      TextStyle(fontFamily: "NunitoSans", color: Colors.grey, fontSize: 16),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: Color.fromARGB(255, 235, 235, 235)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: Colors.grey),
  ),
);