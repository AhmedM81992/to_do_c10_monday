import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_c10_monday/models/task_model.dart';

class FireBaseFunctions {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(fromFirestore: (snapshot, _) {
      return TaskModel.fromJson(snapshot.data() ?? {});
      //?? means if = null return empty to avoid crashes
    }, toFirestore: (task, _) {
      return task.toJson();
    });
  }

  static Future<void> addTask(TaskModel model) {
    var collection = getTaskCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    return docRef.set(model);
    //we leave collection.doc(); empty to make the ID creation automated.Add "manual id" to add ID manually.
    //collection.add(taskModel);
    //collection.get();
    //collection.doc("").delete();
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime date) {
    //we replaced future with stream to stream data in real time to the app.
    // var collection = getTaskCollection();
    // collection.get(); or
    //return getTaskCollection().get();
    return getTaskCollection()
        .where("date",
            isEqualTo: DateUtils.dateOnly(date)
                .millisecondsSinceEpoch) //date.Only for only getting thadate without the time
        .snapshots();
  }

  static deleteTask(String id) {
    getTaskCollection().doc(id).delete();
  }

  static Future<void> updateTask(TaskModel model) {
    return getTaskCollection().doc(model.id).update(model.toJson());
  }
}
//withConverter is the median/middle man between map and model.
//Since that map would be to complicated for the user to manage but is needed by Firestore
//and model is easier to use by the user but it's not supported by the Firestone.
//Since we are going to use it we must make 2 function 1 for map and one for model.
//One function to take model then converts it to map and 2ND functions converts map to model.
//We will apply this in models\task_model.dart
