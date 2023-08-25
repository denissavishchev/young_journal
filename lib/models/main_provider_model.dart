import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier {

  final PageController mainPageController = PageController(initialPage: 0);
  int activePage = 0;

  void changePage(int index) {
    activePage = index;
    notifyListeners();
  }
}