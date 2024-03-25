import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_c10_monday/firebase/firebase_function.dart';
import 'package:to_do_c10_monday/home/home_screen.dart';
import 'package:to_do_c10_monday/my_theme.dart';
import 'package:to_do_c10_monday/providers/my_provider.dart';

class LoginTab extends StatelessWidget {
  LoginTab({super.key});
  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
            child: Text(
              "LogIn",
              style: GoogleFonts.romanesco(
                  fontSize: 40, color: MyThemeData.primaryColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email Field is Empty! Please Enter Your Email!";
                }
                final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value);
                if (!emailValid) {
                  return "Email Format is Incorrect";
                }
                return null;
              },
              decoration: InputDecoration(
                label: Text(
                  'Enter your Email',
                  style: TextStyle(color: MyThemeData.primaryColor),
                  textAlign: TextAlign.center,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide(color: MyThemeData.primaryColor, width: 2),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: MyThemeData.redColor, width: 4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide(color: MyThemeData.primaryColor, width: 4),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: MyThemeData.redColor, width: 2.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: TextFormField(
              controller: passWordController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password Field is Empty! Please Enter Password!";
                } else if (value.length < 6) {
                  return "Incorrect Password length! Password Characters must be more than 5";
                }
                return null;
              },
              decoration: InputDecoration(
                label: Text(
                  'Enter your Password',
                  style: TextStyle(color: MyThemeData.primaryColor),
                  textAlign: TextAlign.center,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide(color: MyThemeData.primaryColor, width: 2),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: MyThemeData.redColor, width: 4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide(color: MyThemeData.primaryColor, width: 4),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: MyThemeData.redColor, width: 2.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: 300,
            child: ElevatedButton(
                onPressed: () {
                  FireBaseFunctions.login(
                      passWordController.text, emailController.text, () {
                    provider.initUser();
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeScreen.routeName, (route) => false);
                  }, (errorMessage) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Error!"),
                            content: Text(errorMessage),
                            actions: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("Try Again!"),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: MyThemeData.primaryColor),
                              )
                            ],
                            backgroundColor: MyThemeData.backgroundColor,
                          );
                        });
                  });
                },
                child: Text(
                  "Log In",
                  style: TextStyle(
                      color: MyThemeData.whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 5, backgroundColor: MyThemeData.primaryColor)),
          )
        ],
      ),
    );
  }
}
