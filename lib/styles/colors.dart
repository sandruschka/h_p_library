import 'package:flutter/material.dart';

extension CustomColorScheme on ColorScheme {
  Color get primaryColor => const Color.fromRGBO(116, 0, 1, 1);
  Color get secondaryColor => const Color.fromRGBO(238, 186, 48, 1);
  Color get secondaryDarkColor => const Color.fromRGBO(182, 137, 0, 1);
  Color get errorColor => const Color.fromRGBO(174, 0, 1, 1);
  Color get backgroundColor => const Color.fromRGBO(192, 192, 192, 1);
}
