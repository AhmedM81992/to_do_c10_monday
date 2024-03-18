import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_c10_monday/firebase/firebase_function.dart';
import 'package:to_do_c10_monday/models/task_model.dart';
import 'package:to_do_c10_monday/my_theme.dart';
import 'package:to_do_c10_monday/providers/add_task_bottom_sheet_provider.dart';
import 'package:to_do_c10_monday/providers/selected_date_provider.dart';

class EditTask extends StatelessWidget {
  TaskModel? taskModel;
  EditTask({Key? key, required this.taskModel}) : super(key: key);
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider =
        Provider.of<AddTaskBottomSheetProvider>(context, listen: false);
    var provider2 = Provider.of<SelectedDateProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Edit Your Task"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 8, right: 30.0, left: 30, bottom: 350),
        child: Container(
          height: 500,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(18)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: taskModel?.title ?? "",
                  ),
                ),
                SizedBox(height: 16.0), // Provides spacing between input fields
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: taskModel?.description ?? "",
                  ),
                ),
                SizedBox(height: 16.0), // Provides spacing between input fields
                SizedBox(height: 16.0),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Select Time",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () {
                    provider.selectDate(context);
                  },
                  child: Text(
                    "${provider2.selectedDate.toString().substring(0, 10)}",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 16.0), // Provides spacing between input fields
                ElevatedButton(
                  onPressed: () {
                    TaskModel model = TaskModel(
                        id: taskModel?.id,
                        title: titleController.text,
                        description: descriptionController.text,
                        date: DateUtils.dateOnly(provider2.selectedDate)
                            .millisecondsSinceEpoch);
                    FireBaseFunctions.updateTask(model);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyThemeData.primaryColor),
                  child: Text(
                    'Save Changes',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: MyThemeData.whiteColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
