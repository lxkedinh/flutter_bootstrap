import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/todo_list/edit_todo_screen.dart';
import 'package:flutter_bootstrap/todo_list/todo_list_provider.dart';
import 'package:provider/provider.dart';

class TodoListItem extends StatefulWidget {
  final String task;

  const TodoListItem({super.key, required this.task});

  @override
  State<StatefulWidget> createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: false,
          onChanged: (bool? value) {
            Provider.of<TodoListProvider>(context, listen: false)
                .delete(widget.task);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Todo \"${widget.task} completed\""),
              duration: Durations.long4,
            ));
          },
        ),
        Expanded(
          child: Text(
            widget.task,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10.0),
          child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EditTodoScreen(todo: widget.task)));
              },
              icon: const Icon(Icons.edit)),
        )
      ],
    );
  }
}
