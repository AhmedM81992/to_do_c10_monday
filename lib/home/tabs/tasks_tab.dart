import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:to_do_c10_monday/home/tabs/sub_elements_in_tasks_tab/my_list_view.dart';
import 'package:to_do_c10_monday/my_theme.dart';
import 'package:to_do_c10_monday/providers/my_provider.dart';
import 'package:to_do_c10_monday/providers/selected_date_provider.dart';

import '../home_screen.dart';

class TasksTab extends StatefulWidget {
  TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  //DateTime selectedDate = DateTime.now(); //replaced by provider

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double dynamicHeight = screenHeight * 0.115;
    var provider = Provider.of<SelectedDateProvider>(context);
    var provider2 = Provider.of<MyProvider>(context);
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          initialSelectedDate: provider.selectedDate,
          selectionColor: MyThemeData.primaryColor,
          selectedTextColor: Colors.white,
          height: dynamicHeight,
          locale: "en",
          daysCount: 365,
          onDateChange: (date) {
            provider.selectedDate = date;
            setState(() {});
            // New date selected
            // setState(() {
            //   selectedValue = date;
            // });
          },
        ),
        MyListView(),
      ],
    );
  }
}
