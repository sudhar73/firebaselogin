import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Texts {
  static double h1 = 12,
      h2 = 14,
      h3 = 16,
      h4 = 18,
      h5 = 20,
      h6 = 22,
      h7 = 24,
      h8 = 26,
      h9 = 28,
      h10 = 30;

  static TextStyle purple1() {
    return TextStyle(
      color: Colors.grey,
      fontSize: 20,
    );
  }

  static TextStyle balck() {
    return TextStyle(
      color: Colors.black,
      fontSize: 22,
    );
  }

  static TextStyle black2() {
    return TextStyle(
      color: Colors.black,
      fontSize: 17,
    );
  }

  static TextStyle balckbold() {
    return TextStyle(
        color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
  }

  static TextStyle white() {
    return TextStyle(
      color: Colors.white,
      fontSize: 20,
    );
  }

  static TextStyle whitehigh() {
    return TextStyle(
      color: Colors.white,
      fontSize: 35,
    );
  }

  static TextStyle whitehighbold() {
    return TextStyle(
        color: Colors.white, fontSize: 33, fontWeight: FontWeight.w700);
  }

  static TextStyle purple() {
    return TextStyle(
        color: Colors.purple, fontSize: 20, fontWeight: FontWeight.w600);
  }

  static TextStyle card() {
    return TextStyle(
      color: Colors.pink,
      fontSize: 13,
    );
  }

  static InputDecoration primary(hint) {
    return InputDecoration(
        hintStyle: TextStyle(color: Colors.black),
        hintText: hint,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.black)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black),
        ));
  }
}
