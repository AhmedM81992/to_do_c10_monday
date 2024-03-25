import 'package:flutter/material.dart';
import 'package:to_do_c10_monday/auth/login.dart';
import 'package:to_do_c10_monday/auth/register.dart';
import 'package:to_do_c10_monday/my_theme.dart';

class AuthScreen extends StatelessWidget {
  static const String routeName = "Auth";
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("ToDo App"),
          bottom: TabBar(
            tabs: [
              Tab(
                  child: Text(
                'Sign In',
                style: TextStyle(color: MyThemeData.whiteColor),
              )),
              Tab(
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: MyThemeData.whiteColor),
                ),
              ),
            ],
            indicatorColor: MyThemeData.primaryColor,
            labelStyle: TextStyle(
                color: MyThemeData.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 20),
            unselectedLabelStyle: TextStyle(
                color: MyThemeData.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        ),
        body: TabBarView(children: [
          LoginTab(),
          RegisterTab(),
        ]),
      ),
    );
  }
}
