import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_c10_monday/providers/home_screen_provider.dart';

class MyBottonNavigationBar extends StatelessWidget {
  const MyBottonNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeScreenProvider>(context);
    return BottomAppBar(
      padding: EdgeInsets.zero,
      shape: CircularNotchedRectangle(),
      notchMargin: 12,
      height: 59,
      child: BottomNavigationBar(
        iconSize: 23,
        onTap: (value) {
          provider.changeIndex(value);
        },
        currentIndex: provider.index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
        ],
      ),
    );
  }
}
