import 'dart:ui';
import 'package:flutter/material.dart';

class ColorStyles {
  static const Color primaryColor = Color.fromRGBO(14, 201, 214, 1);
  static const Color primaryColorDisable = Color.fromRGBO(159, 214, 217, 1);

  static Color borderColor(context) =>
 /*     Theme.of(context).brightness == Brightness.dark
          ? ColorStylesDarkTheme.borderColor
          :*/ ColorStylesLightTheme.borderColor;

  static bool isDark(context) =>
      Theme.of(context).brightness == Brightness.dark;
}

class ColorStylesLightTheme {
  static const Color borderColor = Color(0xff696969);

  static const Color myColorIsNotActive = Color.fromRGBO(46, 46, 46, 1);
  static const Color myCardColor = Color.fromRGBO(250, 250, 250, 1);
  static const Color myColorTextTwo = Color.fromRGBO(46, 46, 46, 0.95);
  static const Color myColorTextThree = Color.fromRGBO(46, 46, 46, 0.5);
  static const Color scaffoldBackgroundColor = Color.fromRGBO(212, 214, 219, 1);
}

class ColorStylesDarkTheme {}
