import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_c10_monday/my_theme.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime chosenDate = DateTime.now();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Add New Task",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 26),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
                label: const Text("Title"),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: MyThemeData.primaryColor),
                    borderRadius: BorderRadius.circular(12)),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: MyThemeData.primaryColor),
                    borderRadius: BorderRadius.circular(12))),
          ),
          const SizedBox(height: 26),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
                label: const Text("Desciption"),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: MyThemeData.primaryColor),
                    borderRadius: BorderRadius.circular(12)),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: MyThemeData.primaryColor),
                    borderRadius: BorderRadius.circular(12))),
          ),
          const SizedBox(height: 26),
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
              selectDate(context);
            },
            child: Text(
              "${chosenDate.toString().substring(0, 10)}",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          ),
          //const Spacer(), we had to remove it so we can use MainAxisSize.min
          //and replaced it with SizedBox.
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: MyThemeData.primaryColor),
              child: const Text(
                "Add Task",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: MyThemeData.whiteColor),
              ),
            ),
          )
        ],
      ),
    );
  }

  selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: chosenDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 360),
      ),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme:
                    ColorScheme.light(primary: MyThemeData.primaryColor)),
            child: child!);
      },
      //barrierColor: MyThemeData.primaryColor
    );
    if (selectedDate != null) {
      chosenDate = selectedDate!;
      setState(() {});
    }
  }
}
