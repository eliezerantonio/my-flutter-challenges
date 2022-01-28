import 'package:flutter/material.dart';
import 'package:nocinema/services/local_storage.dart';

class ThemeChanger with ChangeNotifier {
  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //light
        _darkTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2: //darknunca
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
      LocalStorage.prefs.setInt('darkTheme', 2);
    } else {
      _currentTheme = ThemeData.light();
      LocalStorage.prefs.setInt('darkTheme', 1);
    }

    notifyListeners();
  }
}
