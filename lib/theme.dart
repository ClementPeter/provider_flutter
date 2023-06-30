import 'package:flutter/material.dart';

// class MyThemeProvider with ChangeNotifier {
//   // static bool _isDark ? Theme.dark:ThemeMode.light;
//   bool isDark = true;

//   ThemeData? theme;

//   ThemeData? currentTheme() {
//     theme = (isDark ? ThemeData.dark : ThemeData.light) as ThemeData?;
//     //notifyListeners();
//     return theme;
//     // notifyListeners();
//     // return  ThemeData.dark();
//   }

//   void switchTheme() {
//     isDark = !isDark;
//     notifyListeners();
//   }
// }

//Change Notifier Logic to switch App theme
// class MyThemeProvider with ChangeNotifier {
//   bool isDark = true;

//   ThemeMode? themeMode;

//   ThemeMode? currentTheme() {
//     themeMode = (isDark ? ThemeMode.dark : ThemeMode.light);
//     //notifyListeners();
//     return themeMode;
//     // notifyListeners();
//     // return  ThemeData.dark();
//   }

//   void switchTheme() {
//     print("::theme switched::$isDark:::::");
//     isDark = !isDark;
//     notifyListeners();
//   }
// }
