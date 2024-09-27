import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/auth/auth_provider.dart';
import 'package:flutter_bootstrap/dialogs.dart';
import 'package:flutter_bootstrap/todo_list/todo_list_widget.dart';
import 'package:provider/provider.dart';

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
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(top: 40.0),
                child: TextButton(
                  onPressed: () {
                    try {
                      Provider.of<AuthProvider>(context, listen: false)
                          .signOut();
                    } catch (e) {
                      showAlertDialog(
                          context, "Could not sign out. Try again.");
                    }
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.error),
                  child: const Text("Sign Out"),
                ),
              )),
          Container(
              margin: const EdgeInsets.only(top: 80.0),
              child: Text("Todo List",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ))),
          const Expanded(child: TodoListWidget()),
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
