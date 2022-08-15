import 'package:flutter/material.dart';
import 'package:h_p_library/styles/colors.dart';

class CustomTheme {
  static ThemeData themeData(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: colorTheme.primaryColor,
        onPrimary: Colors.white,
        secondary: colorTheme.secondaryColor,
        onSecondary: Colors.black,
        error: colorTheme.errorColor,
        onError: Colors.white,
        background: colorTheme.backgroundColor,
        onBackground: Colors.black,
        surface: Colors.white,
        onSurface: Colors.black,
      ),
      splashColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        unselectedItemColor: colorTheme.secondaryDarkColor,
        selectedLabelStyle:
            TextStyle(color: colorTheme.secondaryColor, fontSize: 16),
        unselectedLabelStyle: TextStyle(
          color: colorTheme.secondaryColor,
        ),
        selectedItemColor: colorTheme.secondaryDarkColor,
        selectedIconTheme:
            IconThemeData(color: colorTheme.secondaryDarkColor, size: 28),
        unselectedIconTheme:
            IconThemeData(color: colorTheme.secondaryDarkColor, size: 24),
      ),
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
