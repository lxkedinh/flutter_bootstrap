import 'dart:collection';

import 'package:flutter/foundation.dart';

class TodoListModel extends ChangeNotifier {
  final List<String> _todos = List.from(<String>["asdf", "test", "foo", "bar"]);

  UnmodifiableListView<String> get todos => UnmodifiableListView(_todos);

  void add(String todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void delete(String todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}
