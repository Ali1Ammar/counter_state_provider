import 'package:flutter/material.dart';
import 'package:state/model/data/counter_data.dart';
import 'package:state/model/service/counter_service.dart';

class CounterViewModel extends ChangeNotifier {
  final CounterService service;
  Counter counter = Counter(0);

  CounterViewModel(this.service);

  inc() {
    final newNumber = service.incCounter(counter.currentNumber);
    counter = Counter(newNumber);
    notifyListeners();
  }

  dec() {
    final newNumber = service.decCounter(counter.currentNumber);
    counter = Counter(newNumber);
    notifyListeners();
  }
}
