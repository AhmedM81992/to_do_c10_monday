import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:to_do_c10_monday/firebase/firebase_function.dart';
import 'package:to_do_c10_monday/home/tabs/sub_elements_in_tasks_tab/task_items.dart';
import 'package:to_do_c10_monday/home/tabs/tasks_tab.dart';
import 'package:to_do_c10_monday/providers/selected_date_provider.dart';

import '../../../models/task_model.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SelectedDateProvider>(context);
    return Expanded(
      child: StreamBuilder<QuerySnapshot<TaskModel>>(
        //replaced FutureBuilder with StreamBuilder
        stream: FireBaseFunctions.getTasks(provider.selectedDate),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Column(
              children: [
                Text("Somthing went wrong"),
                ElevatedButton(onPressed: () {}, child: Text("TryAgain")),
              ],
            );
          }
          var tasks = snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
          if (tasks.isEmpty) {
            return Center(child: Text("No Tasks Asigned"));
          }
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemBuilder: (context, index) {
              return TaskItem(taskModel: tasks[index]);
            },
            itemCount: tasks.length,
          );
        },
      ),
    );
  }
}
