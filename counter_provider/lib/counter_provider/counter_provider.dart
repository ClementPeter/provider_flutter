import 'package:flutter/foundation.dart';

//Counter Model Provider Class
//The ChangeNotifier class allows us to listen to this class for changes
class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  int get getCounter => _counter;

  bool _isDark = true;

  bool get getDark => _isDark;

  void switchTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  //increment counter then notify any where the function is used using "NotifyListeners"
  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  //decrement counter then notify any where the function is used using "NotifyListeners"
  void decrementCounter() {
    _counter--;
    notifyListeners();
  }
}
