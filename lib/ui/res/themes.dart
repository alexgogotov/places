import 'package:flutter/material.dart';

final lightTheme = ThemeData.light().copyWith(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false),
  iconTheme: IconThemeData(color: Colors.white),
);

final darkTheme = ThemeData.dark().copyWith(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false),
);

extension CustomColorScheme on ColorScheme {
  Color get buttonBackgroundColor => const Color(0xff4caf50);

  Color get cardBackgroundColor => brightness == Brightness.light
      ? const Color(0xfff5f5f5)
      : const Color(0xff1a1a20);

  Color get selectedColor => brightness == Brightness.light
      ? const Color(0xff3b3e5b)
      : const Color(0xffffffff);

  Color get unselectedColor => const Color(0xff7c7e92);

  Color get titleColor =>
      brightness == Brightness.light ? Colors.black : Colors.white;
  Color get titleAntiColor =>
      brightness == Brightness.light ? Colors.white : Colors.black;
}
