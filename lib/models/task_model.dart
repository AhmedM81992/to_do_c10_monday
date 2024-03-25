class TaskModel {
  static const String collectionName = "Tasks";
  String? id;
  String? title;
  String? description;
  int? date;
  bool? isDone;
  String userId;

  //When dealing with database add '?' is a must to avoid red screen on app when database go down.

  TaskModel(
      {this.id = "",
      required this.title,
      required this.description,
      required this.date,
      required this.userId,
      this.isDone = false});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          //Named Constructor
          //This function take map and returns model
          title: json['title'],
          description: json['description'],
          date: json['date'],
          id: json['id'],
          isDone: json['isDone'],
          userId: json['userId'],
        );

  Map<String, dynamic> toJson() {
    //This function takes model and returns it as map.
    return {
      "title": title, //"key": variable
      "description": description,
      "date": date,
      "id": id,
      "isDone": isDone,
      "userId": userId,
    };
  }
}
