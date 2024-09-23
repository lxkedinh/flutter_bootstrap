import 'package:flutter/material.dart';

class TodoListItem extends StatefulWidget {
  final String title;
  final Function(String) onDelete;

  const TodoListItem({super.key, required this.title, required this.onDelete});

  @override
  State<StatefulWidget> createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  bool _completed = false;

  @override
  Widget build(BuildContext context) {

    return Row(
      children: <Widget>[
        Expanded(child: CheckboxListTile(
            value: _completed,
            title: Text(
              widget.title,
              style: _completed ?
              const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.black45, decorationColor: Colors.black45) :
              const TextStyle(decoration: TextDecoration.none),
            ),
            onChanged: (bool? value) {
              setState(() => _completed = value!);
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
        IconButton(
            onPressed: () => widget.onDelete(widget.title),
            icon: const Icon(Icons.delete, color: Colors.red,)
        )
      ],
    );
  }

}