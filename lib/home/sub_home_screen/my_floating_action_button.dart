import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_c10_monday/home/sub_home_screen/add_task_bottom_sheet.dart';
import 'package:to_do_c10_monday/my_theme.dart';
import 'package:to_do_c10_monday/providers/my_provider.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  //we added this padding to make BottomSheet appear Above the keyboard.
                  child: AddTaskBottomSheet());
            });
      },
      backgroundColor: MyThemeData.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          width: 4,
          color: provider.themeMode == ThemeMode.light
              ? MyThemeData.whiteColor
              : MyThemeData.anotherBlack,
        ),
      ),
      child: Icon(
        Icons.add,
        color: provider.themeMode == ThemeMode.light
            ? MyThemeData.whiteColor
            : MyThemeData.anotherBlack,
      ),
    );
  }
}
