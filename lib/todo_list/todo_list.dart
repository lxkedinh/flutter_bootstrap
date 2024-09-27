import 'package:cloud_firestore/cloud_firestore.dart';

class TodoList {
  List<String> tasks;

  TodoList({required this.tasks});

  factory TodoList.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return TodoList(
        tasks: data?['tasks'] is Iterable
            ? List.from(data?['tasks'])
            : List.empty());
  }

  Map<String, dynamic> toFirestore() {
    return {"tasks": tasks};
  }
}
