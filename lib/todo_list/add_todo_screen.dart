import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/todo_list/todo_list_model.dart';
import 'package:provider/provider.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final formController = TextEditingController();

  @override
  void dispose() {
    formController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 200.0, bottom: 40.0),
              child: Text("Add Todo",
                  style: Theme.of(context).textTheme.displayMedium)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              controller: formController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'New Todo',
              ),
            ),
          ),
          FilledButton(
            onPressed: () {
              Provider.of<TodoListModel>(context, listen: false)
                  .add(formController.text);
              Navigator.pop(context);
            },
            child: const Text("Add Todo"),
          ),
        ],
      ),
    );
  }
}
