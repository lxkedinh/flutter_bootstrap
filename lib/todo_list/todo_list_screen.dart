import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/todo_list/todo_list_widget.dart';

import 'add_todo_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 80.0),
              child: Text("Todo List",
                  style: Theme.of(context).textTheme.displayMedium)),
          Expanded(child: TodoListWidget()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddTodoScreen(),
          ),
        ),
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
