import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_c10_monday/my_theme.dart';
import 'package:to_do_c10_monday/providers/my_provider.dart';
import 'package:to_do_c10_monday/providers/selected_date_provider.dart';

class AddTaskBottomSheetProvider extends ChangeNotifier {
  //DateTime chosenDate = DateTime.now(); replaced by provider

  selectDate(BuildContext context) async {
    var provider = Provider.of<SelectedDateProvider>(context, listen: false);
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: provider.selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 360),
      ),
      builder: (context, child) {
        var provider2 = Provider.of<MyProvider>(context);
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: provider2.themeMode == ThemeMode.light
                    ? ColorScheme.light(primary: MyThemeData.primaryColor)
                    : ColorScheme.dark(primary: MyThemeData.primaryColor)),
            child: child!);
      },
      //barrierColor: MyThemeData.primaryColor
    );
    if (selectedDate != null) {
      provider.selectedDate = selectedDate!;
      notifyListeners();
    }
  }
}
