import 'package:flutter/material.dart';

class AppColors {
  static const int primaryColorHex = 0xffF49F4D;
  static const int containerColorHex = 0xffFDDBB7;
  static const Color primaryColor = Color(primaryColorHex);
  static const Color accentColor = Color(accentColorHex);
  static const int accentColorHex = 0xffFEF8F0;
  static const Color containerColor = Color(containerColorHex);
  static const Color containerAccentColor = Color(0xffFFFAF5);
  static const Color greenColor = Color(0xff84AD83);
  static const Color greenAccentColor = Color(0xffECFDF3);
  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color redAccent = Color(0xffB82713);
  static const Color whiteAccent = Color(0xffF2F2F2);
  static const Color textfieldColor = Color(0xFFFFF2E1);
  static const Color backGroundColor = Color(0xffFFEFDB);

  // FEF8F0
  // FFEFDB
  static const MaterialColor primarySwatch = MaterialColor(primaryColorHex, {
    50: primaryColor,
    100: primaryColor,
    200: primaryColor,
    300: primaryColor,
    400: primaryColor,
    500: primaryColor,
    600: primaryColor,
    700: primaryColor,
    800: primaryColor,
    900: primaryColor,
  });

  static const MaterialColor accentSwatch = MaterialColor(accentColorHex, {
    50: accentColor,
    100: accentColor,
    200: accentColor,
    300: accentColor,
    400: accentColor,
    500: accentColor,
    600: accentColor,
    700: accentColor,
    800: accentColor,
    900: accentColor,
  });

  static const MaterialColor containerSwatch =
      MaterialColor(containerColorHex, {
    50: containerColor,
    100: containerColor,
    200: containerColor,
    300: containerColor,
    400: containerColor,
    500: containerColor,
    600: containerColor,
    700: containerColor,
    800: containerColor,
    900: containerColor,
  });

  static Color imageViewerBarrierColor = Colors.grey.withOpacity(0.6);
  static Color shimmerHighlightColor = Colors.grey[100]!;
}
