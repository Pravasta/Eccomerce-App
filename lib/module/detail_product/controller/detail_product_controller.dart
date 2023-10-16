import 'package:flutter/material.dart';

class DetailProductController extends ChangeNotifier {
  int _itemCo = 1;
  int get itemCo => _itemCo;

  set itemCoo(int value) {
    _itemCo = value;
    notifyListeners();
  }

  void addItem() {
    _itemCo++;
    notifyListeners();
  }

  void deleteItem() {
    if (_itemCo != 0) {
      _itemCo--;
    }
    notifyListeners();
  }
}
