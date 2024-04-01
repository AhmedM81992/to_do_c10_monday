import 'package:flutter/material.dart';
import '../home/tabs/settings_tab.dart';
import '../home/tabs/tasks_tab.dart';

class HomeScreenProvider extends ChangeNotifier {
  int index = 0;
  List<Widget> tabs = [const TasksTab(), const SettingsTab()];

  void changeIndex(int value) {
    index = value;
    notifyListeners();
  }
}
