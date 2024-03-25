import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_c10_monday/firebase/firebase_function.dart';
import 'package:to_do_c10_monday/home/tabs/sub_elements_in_tasks_tab/edit_task.dart';
import 'package:to_do_c10_monday/models/task_model.dart';
import 'package:to_do_c10_monday/providers/my_provider.dart';
import 'package:to_do_c10_monday/providers/selected_date_provider.dart';
import '../../../my_theme.dart';

class TaskItem extends StatelessWidget {
  TaskModel taskModel;
  TaskItem({required this.taskModel, super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double dynamicHeight = screenHeight * 0.1;
    double dynamicWidth = screenWidth * 0.1;

    var provider = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: provider.themeMode == ThemeMode.light
              ? MyThemeData.whiteColor
              : MyThemeData.anotherBlack,
          borderRadius: BorderRadius.circular(18)),
      child: Slidable(
        startActionPane:
            ActionPane(motion: DrawerMotion(), extentRatio: .5, children: [
          SlidableAction(
            onPressed: (context) {
              FireBaseFunctions.deleteTask(taskModel.id ?? "");
            },
            backgroundColor: MyThemeData.redColor,
            icon: Icons.delete,
            label: "Delete",
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          SlidableAction(
            onPressed: (context) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditTask(
                            taskModel: taskModel,
                          )));
            },
            backgroundColor: MyThemeData.primaryColor,
            icon: Icons.edit,
            label: "Edit",
          ),
        ]),
        child: Container(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                height: dynamicHeight,
                width: 12,
                decoration: BoxDecoration(
                    color: taskModel.isDone!
                        ? Colors.green
                        : MyThemeData.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(width: dynamicWidth * 0.15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(taskModel.title ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 25)),
                    Text(taskModel.description ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  taskModel.isDone = true;
                  FireBaseFunctions.updateTask(taskModel);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                  decoration: BoxDecoration(
                      color: taskModel.isDone!
                          ? Colors.green
                          : MyThemeData.primaryColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: taskModel.isDone!
                      ? Text(
                          "Done!",
                          style: TextStyle(color: Colors.white),
                        )
                      : Icon(
                          Icons.done,
                          color: MyThemeData.whiteColor,
                          size: 30,
                        ),
                ),
              ),
            ],
          ),
        ), //MyList(
        //   taskModel: TaskModel(
        //       title: taskModel?.title,
        //       description: taskModel?.description,
        //       date: taskModel?.date),
        // ),
      ),
    );
  }
}
