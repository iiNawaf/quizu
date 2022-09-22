import 'package:flutter/material.dart';

const primaryColor = Color(0xff07d2f8);
const bgColor = Color(0xfff0f0f0);
const whiteColor = Color(0xffffffff);
const textColor = Color(0xff797979);
const paddingValue = 15.0;
const dangerColor = Color(0xffbb2124);
const textTitle = TextStyle(fontSize: 25, color: whiteColor, fontWeight: FontWeight.bold);
const subTextTitle = TextStyle(fontSize: 20, color: whiteColor, fontWeight: FontWeight.bold);

ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: bgColor,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: primaryColor,
    centerTitle: true
  ),
  splashFactory: NoSplash.splashFactory,
  highlightColor: Colors.transparent,
  textTheme: TextTheme(
    titleSmall: TextStyle(color: textColor),
    titleMedium: TextStyle(color: textColor),
    titleLarge: TextStyle(color: textColor),
    bodyLarge: TextStyle(color: textColor),
  ),
  inputDecorationTheme: InputDecorationTheme(
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primaryColor)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.white)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primaryColor)),
  ),
  );
