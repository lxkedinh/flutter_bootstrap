import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/todo_list/todo_list_provider.dart';
import 'package:provider/provider.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final todoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 200.0, bottom: 40.0),
              child: Text("Add Todo",
                  style: Theme.of(context).textTheme.displayMedium)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextFormField(
              controller: todoController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'New Todo',
              ),
              validator: (todo) {
                if (todo == null || todo == "") {
                  return "Todo cannot be empty.";
                }

                return null;
              },
            ),
          ),
          FilledButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Provider.of<TodoListProvider>(context, listen: false)
                    .add(todoController.text);
                Navigator.pop(context);
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Todo added")));
              }
            },
            child: const Text("Add Todo"),
          ),
        ],
      ),
    ));
  }
}
