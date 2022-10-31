import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  increaseCounter() {
    _counter++;
    notifyListeners();
  }
}
