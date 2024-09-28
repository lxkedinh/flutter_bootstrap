import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/todo_list/todo_list.dart';
import 'package:flutter_bootstrap/todo_list/todo_list_item.dart';
import 'package:flutter_bootstrap/todo_list/todo_list_provider.dart';
import 'package:provider/provider.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoListProvider>(builder: (context, todoList, child) {
      return StreamBuilder(
        stream: todoList.stream,
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<TodoList>> snapshot) {
          if (snapshot.hasError) {
            return Text(
              "Something went wrong loading todos",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.error),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          TodoList? todoList = snapshot.data?.data();

          if (!snapshot.hasData || todoList!.tasks.isEmpty) {
            return Container(
                margin: const EdgeInsets.only(top: 40.0),
                child: Text("Nothing to do!",
                    style: Theme.of(context).textTheme.bodyLarge));
          }

          return ListView.builder(
              itemCount: snapshot.data!.data()!.tasks.length,
              itemBuilder: (context, index) =>
                  TodoListItem(task: snapshot.data!.data()!.tasks[index]));
        },
      );
    });
  }
}
