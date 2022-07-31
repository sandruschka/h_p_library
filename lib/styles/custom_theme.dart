import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData themeData(BuildContext context) {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      primaryColor: Colors.black,
    );
  }
}

abstract class Spacing {
  static double px4 = 4;
  static double px8 = 8;
  static double px16 = 16;
  static double px20 = 20;
  static double px24 = 24;
  static double px28 = 28;
  static double px32 = 32;
  static double px40 = 40;
  static double px48 = 48;
  static double px56 = 56;
  static double px64 = 64;
  static double px72 = 72;
  static double px80 = 80;
  static double px88 = 88;
  static double px96 = 96;
  static double px160 = 160;
  static double px256 = 256;
  static double px392 = 392;
  static double px552 = 552;
  static double px728 = 728;
}
