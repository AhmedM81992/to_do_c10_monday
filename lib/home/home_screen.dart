import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_c10_monday/home/sub_home_screen/my_botton_navigation_bar.dart';
import 'package:to_do_c10_monday/home/sub_home_screen/my_floating_action_button.dart';
import 'package:to_do_c10_monday/providers/home_screen_provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeScreenProvider>(context);
    return Scaffold(
      extendBody: true, //To make List appear behind the button.
      appBar: AppBar(
        title: const Text("To Do List"),
      ),
      body: provider.tabs[provider.index],
      bottomNavigationBar: const MyBottonNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}
