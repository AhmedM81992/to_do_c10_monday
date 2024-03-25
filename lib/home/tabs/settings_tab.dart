import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:to_do_c10_monday/my_theme.dart';
import 'package:to_do_c10_monday/providers/my_provider.dart';

class SettingsTab extends StatefulWidget {
  SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  final Lang = ['English', "Arabic"];
  final modes = ['Light', "Dark"];
  String? selectedMode;
  String? value;

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            item,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: MyThemeData.primaryColor),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Text(
                      "Language".i18n(),
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    ),
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: provider.themeMode == ThemeMode.light
                              ? MyThemeData.whiteColor
                              : MyThemeData.anotherBlack,
                          border: Border.all(
                              color: MyThemeData.primaryColor, width: 1)),
                      width: 350,
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                        padding: EdgeInsets.only(right: 8),
                        iconSize: 20,
                        iconEnabledColor: MyThemeData.primaryColor,
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                        isExpanded: true,
                        value: value ??
                            provider
                                .languageCode, // Set the initial value to the current language code
                        onChanged: (newValue) {
                          setState(() {
                            value = newValue; // Update the selected language
                          });
                          if (newValue != null) {
                            provider.changeLanguage(
                                newValue); // Change the language in the provider
                          }
                        },
                        items: Lang.map((lang) => DropdownMenuItem(
                              value: lang == 'English'
                                  ? 'en'
                                  : 'ar', // Set the value to the language code
                              child: Text(
                                lang.i18n(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: MyThemeData.primaryColor),
                              ),
                            )).toList(),
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Text(
                      'Mode'.i18n(),
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    ),
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: provider.themeMode == ThemeMode.light
                              ? MyThemeData.whiteColor
                              : MyThemeData.anotherBlack,
                          border: Border.all(
                              color: MyThemeData.primaryColor, width: 1)),
                      width: 350,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          padding: EdgeInsets.only(right: 8),
                          iconSize: 20,
                          iconEnabledColor: MyThemeData.primaryColor,
                          icon: Icon(Icons.keyboard_arrow_down_rounded),
                          isExpanded: true,
                          value: selectedMode ??
                              _getSelectedMode(provider.themeMode),
                          // Set the value
                          onChanged: (value) {
                            // Change newValue to value
                            setState(() {
                              selectedMode = value; // Change newValue to value
                            });
                            if (value == 'Light') {
                              // Change newValue to value
                              provider.changeTheme(ThemeMode.light);
                            } else {
                              provider.changeTheme(ThemeMode.dark);
                            }
                          },
                          items: modes
                              .map((mode) => DropdownMenuItem(
                                    value: mode,
                                    child: Text(
                                      mode,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: MyThemeData.primaryColor),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  String _getSelectedMode(ThemeMode themeMode) {
    return themeMode == ThemeMode.light ? 'Light' : 'Dark';
  }
}
