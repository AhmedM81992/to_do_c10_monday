import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_c10_monday/auth/login/login_connector.dart';
import 'package:to_do_c10_monday/base.dart';

class LoginViewModel extends BaseViewModel<LoginConnector> {
  //inherits from< THIS>
  login(String password, String email) async {
    try {
      connector!.showLoading();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user!.emailVerified || !credential.user!.emailVerified) {
        Future.delayed(Duration(seconds: 2), () {
          connector!.hideLoading();
          connector!.goToHome();
        });
      } else {
        //onError("Please Verify Your Email!");
        connector!.showMessage(message: "Please Verify Your Email!");
      }
    } on FirebaseAuthException catch (e) {
      connector!.showMessage(message: e.message.toString());
    }
  }
}
