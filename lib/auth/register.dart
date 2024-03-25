import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_c10_monday/firebase/firebase_function.dart';
import 'package:to_do_c10_monday/home/home_screen.dart';
import 'package:to_do_c10_monday/my_theme.dart';

class RegisterTab extends StatelessWidget {
  RegisterTab({super.key});

  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  var userNameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
              child: Text(
                "Registration",
                style: GoogleFonts.romanesco(
                    fontSize: 40, color: MyThemeData.primaryColor),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: TextFormField(
                controller: userNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "User Name Field is Empty! Please Enter Name!";
                  } else if (value.length < 2) {
                    return "Incorrect User Name! User Name Characters must be more than 1";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text(
                    'Enter your User Name',
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
                    borderSide:
                        BorderSide(color: MyThemeData.redColor, width: 4),
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
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
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
                    borderSide:
                        BorderSide(color: MyThemeData.redColor, width: 4),
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
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Phone Field is Empty! Please Enter Your Phone!";
                  } else if (value.length < 10) {
                    return "Incorrect Phone Number!";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text(
                    'Enter your phone',
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
                    borderSide:
                        BorderSide(color: MyThemeData.redColor, width: 4),
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
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
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
                    borderSide:
                        BorderSide(color: MyThemeData.redColor, width: 4),
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
                    if (formKey.currentState!.validate()) {
                      FireBaseFunctions.createUserAccount(
                        email: emailController.text,
                        password: passWordController.text,
                        userName: userNameController.text,
                        phone: phoneController.text,
                        onSuccess: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, HomeScreen.routeName, (route) => false);
                        },
                        onError: (errorMessage) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Error!"),
                                  content: Text(errorMessage),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Try Again!"),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              MyThemeData.primaryColor),
                                    )
                                  ],
                                  backgroundColor: MyThemeData.backgroundColor,
                                );
                              });
                        },
                      );
                    }
                  },
                  child: Text(
                    "Confirm Registration",
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
      ),
    );
  }
}
