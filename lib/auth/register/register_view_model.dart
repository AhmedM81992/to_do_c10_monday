import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_c10_monday/auth/register/register_connector.dart';
import 'package:to_do_c10_monday/base.dart';

import '../../firebase/firebase_function.dart';
import '../models/user_model.dart';

class RegisterViewModel extends BaseViewModel<RegisterConnector> {
  void createUserAccount({
    required String email,
    required String password,
    required String userName,
    required String phone,
  }) async {
    try {
      connector!.showLoading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //credential.user?.sendEmailVerification(); //we use it later to Verify emails.
      UserModel user = UserModel(
          id: credential.user?.uid ?? "",
          email: email,
          userName: userName,
          phone: phone);
      FireBaseFunctions.addUser(user).then((value) {});
      connector!.hideLoading();
      connector!.success();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        connector!.hideLoading();
        connector!.showMessage(message: e.message);
      } else if (e.code == 'email-already-in-use') {
        connector!.hideLoading();
        connector!.showMessage(message: e.message);
      }
      connector!.hideLoading();
      connector!.showMessage(message: e.message);
    } catch (e) {
      connector!.hideLoading();
      connector!.showMessage(message: "Something Went Wrong!");
    }
  }
}
