import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/todo_list/todo_list_model.dart';
import 'package:provider/provider.dart';

class TodoListItem extends StatefulWidget {
  final String title;

  const TodoListItem({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  bool _completed = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: CheckboxListTile(
            value: _completed,
            title: Text(
              widget.title,
              style: _completed
                  ? const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.black45,
                      decorationColor: Colors.black45)
                  : const TextStyle(decoration: TextDecoration.none),
            ),
            onChanged: (bool? value) {
              setState(() => _completed = value!);
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
        IconButton(
            onPressed: () => Provider.of<TodoListModel>(context, listen: false)
                .delete(widget.title),
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ))
      ],
    );
  }
}
