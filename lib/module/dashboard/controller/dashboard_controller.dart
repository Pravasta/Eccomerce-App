import 'package:flutter/material.dart';

class DashboardController extends ChangeNotifier {
  int currIndex = 0;

  setPage(int newIndex) {
    currIndex = newIndex;
    notifyListeners();
  }
}
