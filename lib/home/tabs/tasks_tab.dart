import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_c10_monday/home/tabs/sub_elements_in_tasks_tab/my_list_view.dart';
import 'package:to_do_c10_monday/my_theme.dart';
import 'package:to_do_c10_monday/providers/selected_date_provider.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  //DateTime selectedDate = DateTime.now(); //replaced by provider

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SelectedDateProvider>(context);
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          initialSelectedDate: provider.selectedDate,
          selectionColor: MyThemeData.primaryColor,
          selectedTextColor: Colors.white,
          height: 88,
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
        const MyListView(),
      ],
    );
  }
}
