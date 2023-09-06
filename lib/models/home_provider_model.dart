import 'package:flutter/material.dart';
import '../pages/custom_page.dart';
import '../pages/finance_page.dart';
import '../pages/pets_page.dart';
import '../pages/plans_page.dart';

class MainProvider with ChangeNotifier {

  final List pages = [
    const FinancePage(),
    const PlansPage(),
    const PetsPage(),
    const CustomPage(),
  ];

  final List icons = ['hand', 'task', 'pet', 'serves'];

  final PageController mainPageController = PageController(initialPage: 0);
  int activePage = 0;

  void changePage(int index) {
    activePage = index;
    notifyListeners();
  }

}