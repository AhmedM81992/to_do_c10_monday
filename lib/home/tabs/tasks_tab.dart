import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do_c10_monday/home/tabs/sub_tasks_tab/my_list_view.dart';
import 'package:to_do_c10_monday/my_theme.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          selectionColor: MyThemeData.primaryColor,
          selectedTextColor: Colors.white,
          height: 88,
          locale: "en",
          daysCount: 365,
          onDateChange: (date) {
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
