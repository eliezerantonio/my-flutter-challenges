import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //light
        _darkTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2: //dark
        _darkTheme = true;
        _currentTheme = ThemeData.dark();
        break;
      default:
        _darkTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  bool _darkTheme = false;

  ThemeData? _currentTheme;
  ThemeData? get currentTheme => _currentTheme;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
}
