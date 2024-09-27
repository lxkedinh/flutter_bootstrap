import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/todo_list/todo_list_provider.dart';
import 'package:provider/provider.dart';

class EditTodoScreen extends StatefulWidget {
  final String todo;

  const EditTodoScreen({super.key, required this.todo});

  @override
  State<StatefulWidget> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  final newTodoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
              child: Text("Edit Todo",
                  style: Theme.of(context).textTheme.displayMedium)),
          Text("Editing todo: \"${widget.todo}\"",
              style: Theme.of(context).textTheme.bodyLarge),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextFormField(
              controller: newTodoController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Todo Name",
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
                    .edit(widget.todo, newTodoController.text);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Todo edited"),
                  duration: Durations.long4,
                ));
              }
            },
            child: const Text("Edit Todo"),
          ),
        ],
      ),
    ));
  }
}
