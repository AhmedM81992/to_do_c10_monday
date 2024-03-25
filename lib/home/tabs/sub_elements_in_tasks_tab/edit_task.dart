import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_c10_monday/firebase/firebase_function.dart';
import 'package:to_do_c10_monday/models/task_model.dart';
import 'package:to_do_c10_monday/my_theme.dart';
import 'package:to_do_c10_monday/providers/add_task_bottom_sheet_provider.dart';
import 'package:to_do_c10_monday/providers/my_provider.dart';
import 'package:to_do_c10_monday/providers/selected_date_provider.dart';

class EditTask extends StatefulWidget {
  TaskModel? taskModel;
  EditTask({Key? key, required this.taskModel}) : super(key: key);

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  DateTime chosenDate = DateTime.now(); // State to store selected date
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider =
        Provider.of<AddTaskBottomSheetProvider>(context, listen: false);
    var provider2 = Provider.of<SelectedDateProvider>(context, listen: false);
    var provider3 = Provider.of<MyProvider>(context, listen: false);
    double screenHeight = MediaQuery.of(context).size.height;
    double dynamicHeight = screenHeight * 0;
    double screenWidth = MediaQuery.of(context).size.width;
    double dynamicWidth = screenWidth * 0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Edit Your Task",
          style: TextStyle(
            color: provider3.themeMode == ThemeMode.light
                ? MyThemeData.blackColor
                : MyThemeData.whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 8, right: 30.0, left: 30, bottom: 350),
        child: Container(
          height: 500,
          decoration: BoxDecoration(
              color: provider3.themeMode == ThemeMode.light
                  ? MyThemeData.whiteColor
                  : MyThemeData.anotherBlack,
              borderRadius: BorderRadius.circular(18)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: widget.taskModel?.title ?? "",
                  ),
                ),
                SizedBox(height: dynamicHeight * 0.05),
                // Provides spacing between input fields
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: widget.taskModel?.description ?? "",
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                // Provides spacing between input fields
                SizedBox(height: screenHeight * 0.01),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select Time",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: provider3.themeMode == ThemeMode.light
                          ? MyThemeData.blackColor
                          : MyThemeData.whiteColor,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                InkWell(
                  onTap: () {
                    selectDate(context);
                  },
                  child: Text(
                    "${chosenDate.toString().substring(0, 10)}",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                // Provides spacing between input fields
                ElevatedButton(
                  onPressed: () {
                    TaskModel model = TaskModel(
                        id: widget.taskModel?.id,
                        userId: FirebaseAuth.instance.currentUser!.uid,
                        title: titleController.text,
                        description: descriptionController.text,
                        date: DateUtils.dateOnly(chosenDate)
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
                      color: provider3.themeMode == ThemeMode.light
                          ? MyThemeData.blackColor
                          : MyThemeData.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to select date
  void selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: chosenDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 360)),
      builder: (context, child) {
        var provider = Provider.of<MyProvider>(context);
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: provider.themeMode == ThemeMode.light
                ? ColorScheme.light(primary: MyThemeData.primaryColor)
                : ColorScheme.dark(primary: MyThemeData.primaryColor),
          ),
          child: child!,
        );
      },
    );
    if (selectedDate != null) {
      setState(() {
        chosenDate = selectedDate;
      });
    }
  }
}
