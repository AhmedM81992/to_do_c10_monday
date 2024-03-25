import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:to_do_c10_monday/firebase/firebase_function.dart';
import 'package:to_do_c10_monday/models/task_model.dart';
import 'package:to_do_c10_monday/my_theme.dart';
import 'package:to_do_c10_monday/providers/my_provider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime chosenDate = DateTime.now(); // State to store selected date
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double dynamicHeight = screenHeight * 0.02;
    double screenWidth = MediaQuery.of(context).size.width;
    double dynamicWidth = screenWidth * 0.02;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Add New Task",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: dynamicHeight),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              label: Text(
                "Title",
                style: TextStyle(
                  color: provider.themeMode == ThemeMode.light
                      ? MyThemeData.blackColor
                      : MyThemeData.whiteColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: MyThemeData.primaryColor),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: MyThemeData.primaryColor),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: dynamicHeight),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
              label: Text(
                "Description",
                style: TextStyle(
                  color: provider.themeMode == ThemeMode.light
                      ? MyThemeData.blackColor
                      : MyThemeData.whiteColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: MyThemeData.primaryColor),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: MyThemeData.primaryColor),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: dynamicHeight),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Select Time",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: provider.themeMode == ThemeMode.light
                    ? MyThemeData.blackColor
                    : MyThemeData.whiteColor,
              ),
            ),
          ),
          SizedBox(height: dynamicHeight),
          InkWell(
            onTap: () {
              selectDate(context); // Call the selectDate function directly
            },
            child: Text(
              "${chosenDate.toString().substring(0, 10)}",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: provider.themeMode == ThemeMode.light
                    ? MyThemeData.blackColor
                    : MyThemeData.whiteColor,
              ),
            ),
          ),
          SizedBox(height: dynamicHeight),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                TaskModel model = TaskModel(
                  title: titleController.text,
                  userId: FirebaseAuth.instance.currentUser!.uid,
                  description: descriptionController.text,
                  date: DateUtils.dateOnly(chosenDate).millisecondsSinceEpoch,
                );
                // FireBaseFunctions.addTask(model).then((value) {
                //   Navigator.pop(
                //       context); //to remove the pop screen when done.NOTE: works only when await FirebaseFirestore.instance.enableNetwork() is enabled in main.dart
                // });
                FireBaseFunctions.addTask(model);
                //We removed .then to make the popup work online and offline.
                Navigator.pop(context);
                //We changed it to this in order to store data locally on the phone
                //But by doing that data well never get to be stored on Cloud FireStore
                //Note: This works with await FirebaseFirestore.instance.disableNetwork()
                //And await FirebaseFirestore.instance.enableNetwork().
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MyThemeData.primaryColor,
              ),
              child: Text(
                "Add Task",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: provider.themeMode == ThemeMode.light
                      ? MyThemeData.blackColor
                      : MyThemeData.whiteColor,
                ),
              ),
            ),
          ),
        ],
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

// FireBaseFunctions.addTask(model).then((value) {
//   Navigator.pop(
//       context); //to remove the pop screen when done.NOTE: works only when await FirebaseFirestore.instance.enableNetwork() is enabled in main.dart
// });
//FireBaseFunctions.addTask(model);
//We removed .then to make the popup work online and offline.
//Navigator.pop(context);
//We changed it to this in order to store data locally on the phone
//But by doing that data well never get to be stored on Cloud FireStore
//Note: This works with await FirebaseFirestore.instance.disableNetwork()
//And await FirebaseFirestore.instance.enableNetwork().
