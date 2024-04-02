import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_c10_monday/models/task_model.dart';

class FireBaseFunctions {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks") //create collection called Tasks
        .withConverter<TaskModel>(fromFirestore: (snapshot, _) {
      return TaskModel.fromJson(snapshot.data() ?? {});
    }, toFirestore: (task, _) {
      return task.toJson();
    });
  }

  //FirebaseFirestore.instance.collection("Tasks").add("data")

  // void addTask(TaskModel taskModel) {
  //   //create collection called Tasks
  //   FirebaseFirestore.instance.collection("Tasks").withConverter(
  //      //converts it from model to map
  //     //(snapshot,option) we usually don't use options because
  //     //we got no use for it.we usually leave it with "_" it means we dont use it
  //     fromFirestore: (snapshot, _) {
  //       return TaskModel.fromJson(snapshot.data()!);
  //       //it returns Map from firebase if it's null it returns empty map.
  //       //?? means if = null return empty to avoid crashes.
  //     },
  //     toFirestore: (task, options) {
  //       return task.toJson();
  //      //task here is an object of the TaskModel.
  //     },
  //   ).add()/.get()/.doc("").delete();
  // }

  //snapshot often refers to a DocumentSnapshot.
  //DocumentSnapshot contains data read from a document in your Firestore database.
  //The data can be extracted with the data() method.

  static Future<void> addTask(TaskModel model) {
    var collection = getTaskCollection();
    //collection.add(taskModel); //adds taskModel to firebase
    //collection.get();  we use this get data from firebase
    //collection.doc("").delete(); we use this to delete data from firebase
    var docRef = collection.doc();
    //we leave it empty to make the ID creation automated.Add "manual id" to add ID manually.
    model.id = docRef.id;
    //we took id from doc() and entered it into task
    return docRef.set(model);
    //then we took the whole model then sent it to database
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime date) {
    //we replaced future with stream to stream data in real time to the app.
    // var collection = getTaskCollection();
    // collection.get(); or
    //return getTaskCollection().get();
    return getTaskCollection()
        .where("date", isEqualTo: date.millisecondsSinceEpoch)
        .snapshots();
  }
}
//withConverter is the median/middle man between map and model.
//Since that map would be to complicated for the user to manage but is needed by Firestore
//and model is easier to use by the user but it's not supported by the Firestone.
//Since we are going to use it we must make 2 function 1 for map and one for model.
//One function to take model then converts it to map and 2ND functions converts map to model.
//We will apply this in models\task_model.dart
