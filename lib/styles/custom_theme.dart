import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData themeData(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color.fromRGBO(116, 0, 1, 1),
        onPrimary: Colors.white,
        secondary: Color.fromRGBO(238, 186, 48, 1),
        onSecondary: Colors.black,
        error: Color.fromRGBO(174, 0, 1, 1),
        onError: Colors.white,
        background: Color.fromRGBO(192, 192, 192, 1),
        onBackground: Colors.black,
        surface: Colors.white,
        onSurface: Colors.black,
      ),
      splashColor: Colors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        unselectedItemColor: Color.fromRGBO(182, 137, 0, 1),
        selectedLabelStyle:
            TextStyle(color: Color.fromRGBO(238, 186, 48, 1), fontSize: 16),
        unselectedLabelStyle: TextStyle(
          color: Color.fromRGBO(238, 186, 48, 1),
        ),
        selectedItemColor: Color.fromRGBO(182, 137, 0, 1),
        selectedIconTheme:
            IconThemeData(color: Color.fromRGBO(182, 137, 0, 1), size: 28),
        unselectedIconTheme:
            IconThemeData(color: Color.fromRGBO(182, 137, 0, 1), size: 24),
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
