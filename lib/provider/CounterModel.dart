import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier{

  int _counter = 0;
  int _counterA = 0;

  get value => _counter;
  get valueA => _counterA;


  void increment(){
    _counter++;

    notifyListeners();

  }

  void incrementA(){
    _counterA++;
    notifyListeners();
  }
}