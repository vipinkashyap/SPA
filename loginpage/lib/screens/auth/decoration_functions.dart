import 'package:flutter/material.dart';
import 'package:loginpage/config/palette.dart';

InputDecoration registerInputDecoration({String hintText}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
    hintStyle: const TextStyle(color: Colors.white, fontSize: 20),
    hintText: hintText,
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 3),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Palette.lightGreen),
    ),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent),
    ),
    focusedErrorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: Colors.redAccent),
    ),
    errorStyle: const TextStyle(color: Colors.redAccent),
  );
}

InputDecoration signInInputDecoration({String hintText}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
    hintStyle: const TextStyle(fontSize: 20.0),
    hintText: hintText,
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(width: 3, color: Colors.black),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent),
    ),
    focusedErrorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(width: 3, color: Colors.redAccent),
    ),
    errorStyle: const TextStyle(color: Colors.redAccent),
  );
}
