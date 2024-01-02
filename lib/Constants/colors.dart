import 'dart:ui';
import 'package:flutter/material.dart';


Map<int, Color> color = {
  50: const Color.fromRGBO(0, 0, 0, 16),
  100: const Color.fromRGBO(255, 255, 255, .2),
  200: const Color.fromRGBO(255, 255, 255, .3),
  300: const Color.fromRGBO(255, 255, 255, .4),
  400: const Color.fromRGBO(255, 255, 255, .5),
  500: const Color.fromRGBO(255, 255, 255, .6),
  600: const Color.fromRGBO(255, 255, 255, .7),
  700: const Color.fromRGBO(255, 255, 255, .8),
  800: const Color.fromRGBO(255, 255, 255, .9),
  900: const Color.fromRGBO(255, 255, 255, 1),
};

const int _mainColor = 0xFF0074FF;
MaterialColor kPrimaryColor = MaterialColor(_mainColor, color);
//common
const Color kMainColor = Color(_mainColor);
const Color kGreenColor = Color(0xFF27AE60);
const Color kBlueColor = Color(0xFF323FDA);
const Color kpurpleColor = Color(0xFFF3064D);
const Color kLightBlueColor = Color(0xFF14C9E7);
const Color kOrangeColor = Color(0xFFFE6F1D);
const Color kSecondaryColor = Color(0xFFE61518);
const Color kBrownColor = Colors.brown;
const Color kBlackDarkColor = Color(0xFFCFCFCF);
const Color kGreyColor = Color(0xFFCECECE);
const Color kDarkGreyColor = Color.fromARGB(255, 150, 150, 150);
const Color kTransparent = Colors.transparent;
const Color kBlackColor = Colors.black;
const Color kErrorColor = Color(0xFFFF0000);
const Color kWhiteColor = Color(0xffffffff);
const Color background = Color(0xFFF5F9FF);
const Color backgroundAccent = Color(0xFFC3C3C3);
const Color lightG = Color(0xFFF0F0F0);
const Color black = Color(0xFF000000);
const Color grey = Color(0xFF747474);
const Color khinttext = Color(0xFF222427);
const Color outlineB = Color(0xFFD3D6E0);
const Color klabelT = Color(0xFFBCBFC3);
const IconThemeData iconDarkTheme = IconThemeData(color: kBlackColor);
