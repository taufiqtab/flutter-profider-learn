import 'package:flutter/material.dart';

class Counter2 with ChangeNotifier {
  int _counter;

  Counter2(this._counter);

  getCounter() => _counter;
  setCounter(int counter) => _counter = counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  int getFinal(int val1, int val2){
    return (val1 + val2);
  }
}