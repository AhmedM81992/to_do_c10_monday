import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:to_do_c10_monday/auth/auth.dart';
import 'package:to_do_c10_monday/firebase/firebase_function.dart';
import 'package:to_do_c10_monday/home/sub_home_screen/my_botton_navigation_bar.dart';
import 'package:to_do_c10_monday/home/sub_home_screen/my_floating_action_button.dart';
import 'package:to_do_c10_monday/providers/home_screen_provider.dart';
import 'package:to_do_c10_monday/providers/my_provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeScreenProvider>(context);
    var provider2 = Provider.of<MyProvider>(context);
    return Scaffold(
      extendBody: true, //To make List appear behind the button.
      appBar: AppBar(
        title: Row(
          children: [
            Text("ToDo, "),
            Text("Hello! ${provider2.userModel?.userName}".i18n())
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                FireBaseFunctions.logOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, AuthScreen.routeName, (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: provider.tabs[provider.index],
      bottomNavigationBar: MyBottonNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MyFloatingActionButton(),
    );
  }
}
