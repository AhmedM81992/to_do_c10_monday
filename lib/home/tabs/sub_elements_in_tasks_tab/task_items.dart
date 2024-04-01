import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_c10_monday/models/task_model.dart';
import 'package:to_do_c10_monday/providers/selected_date_provider.dart';
import '../../../my_theme.dart';

class TaskItem extends StatelessWidget {
  TaskModel taskModel;
  TaskItem({required this.taskModel, super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SelectedDateProvider>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: MyThemeData.whiteColor,
          borderRadius: BorderRadius.circular(18)),
      child: Slidable(
        startActionPane:
            ActionPane(motion: const DrawerMotion(), extentRatio: .5, children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: MyThemeData.redColor,
            icon: Icons.delete,
            label: "Delete",
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: MyThemeData.primaryColor,
            icon: Icons.edit,
            label: "Edit",
          ),
        ]),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 12,
                decoration: BoxDecoration(
                    color: MyThemeData.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(taskModel.title ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 25)),
                    Text(taskModel.description ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                decoration: BoxDecoration(
                    color: MyThemeData.primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: const Icon(
                  Icons.done,
                  color: MyThemeData.whiteColor,
                  size: 30,
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
