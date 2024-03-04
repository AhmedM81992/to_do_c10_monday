import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_c10_monday/home/tabs/sub_elements_in_tasks_tab/my_list.dart';
import '../../../my_theme.dart';

Widget TaskItem() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
        color: MyThemeData.whiteColor, borderRadius: BorderRadius.circular(18)),
    child: Slidable(
      startActionPane:
          ActionPane(motion: DrawerMotion(), extentRatio: .5, children: [
        SlidableAction(
          onPressed: (context) {},
          backgroundColor: MyThemeData.redColor,
          icon: Icons.delete,
          label: "Delete",
          borderRadius: BorderRadius.only(
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
      child: MyList(),
    ),
  );
}
