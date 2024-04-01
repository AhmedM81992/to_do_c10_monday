import 'package:flutter/material.dart';
import 'package:to_do_c10_monday/home/sub_home_screen/add_task_bottom_sheet.dart';
import 'package:to_do_c10_monday/my_theme.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: const AddTaskBottomSheet());
            });
      },
      backgroundColor: MyThemeData.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: const BorderSide(width: 4, color: MyThemeData.whiteColor),
      ),
      child: const Icon(
        Icons.add,
        color: MyThemeData.whiteColor,
      ),
    );
  }
}
