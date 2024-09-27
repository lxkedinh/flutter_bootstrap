import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/auth/auth_provider.dart';
import 'package:flutter_bootstrap/todo_list/todo_list.dart';

class TodoListProvider extends ChangeNotifier {
  late AuthProvider? _auth;
  late FirebaseFirestore _db;
  late final DocumentReference<TodoList> _docRef;
  late final Stream<DocumentSnapshot<TodoList>> stream;

  TodoListProvider([AuthProvider? auth]) {
    _auth = auth;
    _db = FirebaseFirestore.instance;
    _docRef = _db.collection("todos").doc(_auth?.user?.uid).withConverter(
        fromFirestore: TodoList.fromFirestore,
        toFirestore: (TodoList tasks, _) => tasks.toFirestore());
    stream = _docRef.snapshots();
  }

  void add(String todo) {
    _docRef.update({
      "tasks": FieldValue.arrayUnion(List<String>.of([todo]))
    });
    notifyListeners();
  }

  void edit(String oldTodo, String newTodo) {
    delete(oldTodo);
    add(newTodo);
  }

  void delete(String todo) {
    _docRef.update({
      "tasks": FieldValue.arrayRemove(List<String>.of([todo]))
    });
    notifyListeners();
  }
}
