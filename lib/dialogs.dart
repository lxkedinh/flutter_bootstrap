import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("Todo List"),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.pop(context, "Dismiss"),
                  child: const Text("Dismiss"))
            ],
          ));
}
