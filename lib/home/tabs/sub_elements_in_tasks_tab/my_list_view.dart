import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_c10_monday/home/tabs/sub_elements_in_tasks_tab/task_items.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 12),
        itemBuilder: (context, index) {
          return TaskItem();
        },
        itemCount: 10,
      ),
    );
  }
}
