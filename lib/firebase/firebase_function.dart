import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_c10_monday/auth/models/user_model.dart';
import 'package:to_do_c10_monday/models/task_model.dart';

//ff
class FireBaseFunctions {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection(TaskModel.collectionName)
        .withConverter<TaskModel>(fromFirestore: (snapshot, _) {
      return TaskModel.fromJson(snapshot.data() ?? {});
      //?? means if = null return empty to avoid crashes
    }, toFirestore: (task, _) {
      return task.toJson();
    });
  }

  // =========================================================================================================================

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(fromFirestore: (snapshot, _) {
      return UserModel.fromJson(snapshot.data()!);
      //?? means if = null return empty to avoid crashes
    }, toFirestore: (user, _) {
      return user.toJson();
    });
  }

  // =========================================================================================================================

  static Future<void> addUser(UserModel user) {
    var collection = getUsersCollection();
    var docRef = collection.doc(user.id);
    return docRef.set(user);
  }

  // =========================================================================================================================

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
    //we leave collection.doc(); empty to make the ID creation automated.Add "manual id" to add ID manually.
    //collection.add(taskModel);
    //collection.get();
    //collection.doc("").delete();
    //then we took the whole model then sent it to database
  }

  // =========================================================================================================================

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime date) {
    //we replaced future with stream to stream data in real time to the app.
    // var collection = getTaskCollection();
    // collection.get(); or
    //return getTaskCollection().get();
    return getTaskCollection()
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("date",
            isEqualTo: DateUtils.dateOnly(date)
                .millisecondsSinceEpoch) //date.Only for only getting thadate without the time
        .orderBy("title", descending: true)
        .snapshots();
  }

  // =========================================================================================================================

  static deleteTask(String id) {
    getTaskCollection().doc(id).delete();
  }

  static Future<void> updateTask(TaskModel model) {
    return getTaskCollection().doc(model.id).update(model.toJson());
  }

  // =========================================================================================================================

  static void createUserAccount({
    required String email,
    required String password,
    required String userName,
    required String phone,
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //credential.user?.sendEmailVerification(); //we use it later to Verify emails.
      UserModel user = UserModel(
          id: credential.user?.uid ?? "",
          email: email,
          userName: userName,
          phone: phone);
      addUser(user).then((value) {
        onSuccess();
        /*or
        * await addUser(user);
        * onSuccess();
        * */
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);
      }
      onError(e.message);
    } catch (e) {
      onError("Something Went Wrong!");
    }
  }

  // =========================================================================================================================

  static login(String password, String email, Function onSuccess,
      Function onError) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user!.emailVerified || !credential.user!.emailVerified) {
        onSuccess();
      } else {
        onError("Please Verify Your Email!");
      }
    } on FirebaseAuthException catch (e) {
      onError("Wrong Email or Password");
    }
  }

// =========================================================================================================================

  static Future<UserModel?> readUser() async {
    //reads user name.
    String id = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot<UserModel> documentSnapshot =
        await getUsersCollection().doc(id).get();
    return documentSnapshot.data();
  }

// =========================================================================================================================

  static void logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

//withConverter is the median/middle man between map and model.
//Since that map would be to complicated for the user to manage but is needed by Firestore
//and model is easier to use by the user but it's not supported by the Firestone.
//Since we are going to use it we must make 2 function 1 for map and one for model.
//One function to take model then converts it to map and 2ND functions converts map to model.
//We will apply this in models\task_model.dart
