import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_c10_monday/my_theme.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 12),
        itemBuilder: (context, index) {
          return taskItem();
        },
        itemCount: 10,
      ),
    );
  }

  Widget taskItem() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: MyThemeData.whiteColor,
          borderRadius: BorderRadius.circular(18)),
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
        child: Container(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 12,
                decoration: BoxDecoration(
                    color: MyThemeData.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Task TitleTask TitleTask TitleTask Title",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 25)),
                    Text("Task Desciption",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                  decoration: BoxDecoration(
                      color: MyThemeData.primaryColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Icon(
                    Icons.done,
                    color: MyThemeData.whiteColor,
                    size: 30,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
