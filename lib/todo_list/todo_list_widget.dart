import 'package:flutter/cupertino.dart';
import 'package:flutter_bootstrap/todo_list/todo_list_item.dart';
import 'package:flutter_bootstrap/todo_list/todo_list_model.dart';
import 'package:provider/provider.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoListModel>(builder: (context, todoList, child) {
      return ListView.builder(
        itemCount: todoList.todos.length,
        itemBuilder: (context, index) =>
            TodoListItem(title: todoList.todos[index]),
      );
    });
  }
}
