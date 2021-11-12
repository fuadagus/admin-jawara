import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class Todo {
  String? key;
  String name;
  int stocks;
  Timestamp updateAt;

  Todo(this.name, this.stocks, this.updateAt);

  Todo.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        name = snapshot.value["userId"],
        stocks = snapshot.value["subject"],
        updateAt = snapshot.value["completed"];

  static String? newMethod(DataSnapshot snapshot) => snapshot.key;

  toJson() {
    return {
      "userId": name,
      "subject": stocks,
      "completed": updateAt,
    };
  }
}
