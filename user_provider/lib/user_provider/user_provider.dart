import 'package:flutter/material.dart';

//Provider class to update app state
class UserProvider extends ChangeNotifier {
  //controller
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  //using private variable and getters to hold value
  String _userName = 'cache data';
  int _userPassword = 0;

  String get userName => _userName;
  int get userPassword => _userPassword;

  //using function to save values to private variable
  void updateName(String name) {
    _userName = name;
    notifyListeners();
  }

  void updatePassword(int password) {
    _userPassword = password;
    notifyListeners();
  }
}
