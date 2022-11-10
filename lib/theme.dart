import 'package:flutter/material.dart';

class CColors {
  static const mainColor = Color.fromARGB(255, 127, 26, 158);
  static const white = Colors.white;
  static const textColor = Color(0xffCECECE);
  static const backgroundcolor = Color(0xff171A21);
  static const foregroundBlack = Color(0xff202020);
  static const subtitleColor = Color(0xff979797);
  static const black = Colors.black;
  static const red = Colors.red;
  static const darkSubtitle = Color(0xff92928E);
  static const borderColor = Color.fromARGB(255, 115, 51, 99);
  static const sideColor = Color(0x4cb7b7b3);
  static const panelColor = Color(0x1E1F3353);

  static const Map<int, Color> primarySwatchColors = {
    50: Color.fromRGBO(127, 26, 158, .1),
    100: Color.fromRGBO(127, 26, 158, .2),
    200: Color.fromRGBO(127, 26, 158, .3),
    300: Color.fromRGBO(127, 26, 158, .4),
    400: Color.fromRGBO(127, 26, 158, .5),
    500: Color.fromRGBO(127, 26, 158, .6),
    600: Color.fromRGBO(127, 26, 158, .7),
    700: Color.fromRGBO(127, 26, 158, .8),
    800: Color.fromRGBO(127, 26, 158, .9),
    900: Color.fromRGBO(127, 26, 158, 1),
  };

  static const primarySwatch = MaterialColor(0xff1A659E, primarySwatchColors);
}

class Styles {
  static RoundedRectangleBorder get shapeRounded8 => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      );

  static RoundedRectangleBorder get shapeRounded16 => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      );

  static RoundedRectangleBorder get shapeRounded20 => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      );

  static TextStyle get smallSubtitle => const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: CColors.darkSubtitle,
      );

  static TextStyle get subtitle => const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w300,
        color: CColors.subtitleColor,
      );

  static TextStyle get biggerSubtitle => const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w300,
        color: CColors.subtitleColor,
      );

  static TextStyle get title => const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get bigTitle => const TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get biggerTitle => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get evenBiggerTitle => const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get description => const TextStyle(
        fontSize: 15,
        height: 1.23,
        color: CColors.subtitleColor,
      );
}
