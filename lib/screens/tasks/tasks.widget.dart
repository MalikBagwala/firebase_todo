import 'package:firebase_todo/main.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "../tasks/task.widget.dart";

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map> tasks = Provider.of<TodoState>(context).tasks;
    return ListView.builder(
      itemBuilder: (context, index) {
        return Task(
          id: tasks[index]['id'],
          key: Key(tasks[index]['id']),
          title: tasks[index]['name'],
          isChecked: tasks[index]['isChecked'],
        );
      },
      itemCount: tasks.length,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
    );
  }
}
