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
  bool _completed = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: _completed,
          onChanged: (bool? value) {
            setState(() => _completed = value!);
            Provider.of<TodoListProvider>(context, listen: false)
                .delete(widget.task);
          },
        ),
        Expanded(
          child: Text(
            widget.task,
            style: _completed
                ? const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.black45,
                    decorationColor: Colors.black45)
                : const TextStyle(decoration: TextDecoration.none),
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
