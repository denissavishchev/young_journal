import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import '../pages/settings_page.dart';
import '../pages/kid_task_page.dart';
import '../pages/pets_page.dart';
import '../pages/plans_page.dart';

class MainProvider with ChangeNotifier {

  final List pages = [
    const KidTaskPage(),
    const PlansPage(),
    const PetsPage(),
    const SettingsPage(),
  ];

  final List icons = ['hand', 'task', 'pet', 'serves'];

  final List icon = [
    Icons.self_improvement,
    Icons.supervisor_account,
    Icons.playlist_add_check,
    Icons.settings,];

  final PageController mainPageController = PageController(initialPage: 0);
  int activePage = 0;

  void changePage(int index) {
    activePage = index;
    notifyListeners();
  }

  void initPage() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email')!;
  }

}