import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color primaryColor = Color(0xFF5D9CEC);
  static const Color primaryDarkColor = Color(0xFF141922);
  static const Color blackColor = Color(0xFF060E1E);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color greenColor = Color(0xFF61E757);
  static const Color backgroundColor = Color(0xFFDFECDB);
  static const Color backgroundColorDark = Color(0xFF060E1E);
  static const Color greyColor = Color(0xFFC8C9CB);
  static const Color redColor = Color(0xFFaf000f);
  static const Color anotherBlack = Color(0xFF141922);

  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
          fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black),
      bodyMedium:
          GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
      bodySmall: GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w700),
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      titleTextStyle: GoogleFonts.poppins(
          fontSize: 22, fontWeight: FontWeight.w700, color: whiteColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: MyThemeData.primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: MyThemeData.greyColor,
        elevation: 0,
        backgroundColor: Colors.transparent),
  );
  static ThemeData darkTheme = ThemeData(
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: MyThemeData.whiteColor),
      bodyMedium:
          GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
      bodySmall: GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w700),
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backgroundColorDark,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      titleTextStyle: GoogleFonts.poppins(
          fontSize: 22, fontWeight: FontWeight.w700, color: blackColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: MyThemeData.primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: MyThemeData.whiteColor,
        elevation: 0,
        backgroundColor: Colors.transparent),
  );
}
