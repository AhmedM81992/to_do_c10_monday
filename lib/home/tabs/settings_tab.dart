import 'package:flutter/material.dart';
import 'package:to_do_c10_monday/my_theme.dart';

class SettingsTab extends StatefulWidget {
  SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  final Lang = ['English', "Arabic"];
  final mode = ['Light', "Dark"];
  String? value;
  String? value2;

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
                      "Language",
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
                          color: Colors.white,
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
                          value: value, // Set the value
                          items: Lang.map(buildMenuItem).toList(),
                          onChanged: (newValue) =>
                              setState(() => value = newValue),
                        ),
                      ),
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
                      "Mode",
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
                          color: Colors.white,
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
                          value: value2, // Set the value
                          items: mode.map(buildMenuItem).toList(),
                          onChanged: (newValue) =>
                              setState(() => value2 = newValue),
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
}
