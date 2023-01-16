import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int count;
  Counter(this.count);

  void increment() {
    count += 1;
    notifyListeners();
  }

  void decrement() {
    count -= 1;
    notifyListeners();
  }
}