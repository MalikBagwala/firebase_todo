import 'package:firebase_todo/main.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class Task extends StatelessWidget {
  final bool isChecked;
  final String title;
  final Function onChange;
  final String id;
  Task({Key key, this.id, this.isChecked, this.title, this.onChange})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChecked,
      activeColor: Colors.pink,
      onChanged: (value) async {
        var todos = await TodoState().getTodos();
        // print(todos);
        // print(todos);
        Provider.of<TodoState>(context, listen: false).toggle(id);
      },
      title: Text(
        title,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
    );
  }
}
