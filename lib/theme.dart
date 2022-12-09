import 'package:flutter/material.dart';

class MyThemeProvider with ChangeNotifier {
  // static bool _isDark ? Theme.dark:ThemeMode.light;
  bool _isDark = true;

  ThemeData? theme;

  ThemeData? currentTheme() {
    theme = (_isDark ? ThemeData.dark : ThemeData.light) as ThemeData?;
    //notifyListeners();
    return theme;
    // notifyListeners();
    // return  ThemeData.dark();
  }

  void switchTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
