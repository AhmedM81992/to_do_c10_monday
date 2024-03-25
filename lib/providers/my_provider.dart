import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_c10_monday/auth/models/user_model.dart';
import 'package:to_do_c10_monday/firebase/firebase_function.dart';

class MyProvider extends ChangeNotifier {
  User? firebaseUser;
  UserModel? userModel;
  String languageCode = "en";
  ThemeMode themeMode = ThemeMode.light;

  MyProvider() {
    // constructor
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initUser();
    }
  }

  initUser() async {
    userModel = await FireBaseFunctions.readUser();
    notifyListeners();
    //we used await and sync because we used it for nullable
  }

  void changeTheme(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }

  void changeLanguage(String langCode) {
    languageCode = langCode;
    notifyListeners();
  }

  String getBackgroundPath() {
    if (themeMode == ThemeMode.light) {
      return "assets/images/back_ground/light/bg.png";
    } else {
      return "assets/images/back_ground/dark/bg.png";
    }
  }
}
