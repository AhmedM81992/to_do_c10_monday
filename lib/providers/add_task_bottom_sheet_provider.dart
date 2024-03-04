import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_c10_monday/my_theme.dart';

class AddTaskBottomSheetProvider extends ChangeNotifier {
  DateTime chosenDate = DateTime.now();

  selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: chosenDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 360),
      ),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme:
                    ColorScheme.light(primary: MyThemeData.primaryColor)),
            child: child!);
      },
      //barrierColor: MyThemeData.primaryColor
    );
    if (selectedDate != null) {
      chosenDate = selectedDate!;
      notifyListeners();
    }
  }
}
