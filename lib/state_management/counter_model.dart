import 'package:flutter/foundation.dart';

//The cChangeNotifier class allows us to listen to this class for changes
class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get getCounter => _counter;

  //ncrement counter then notify any where the function is used using "NotifyListeners"
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
