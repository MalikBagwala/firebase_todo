import 'package:firebase_todo/main.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "../tasks/task.widget.dart";

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map> tasks = Provider.of<TodoState>(context).tasks;
    // return ListView.builder(
    //   itemBuilder: (context, index) {

    //   },
    //   itemCount: tasks.length,
    // );
    return ReorderableListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          for (var task in tasks)
            Task(
              id: task['id'],
              key: Key(task['id']),
              title: task['name'],
              isChecked: task['isChecked'],
            ),
        ],
        onReorder: (oldIndex, newIndex) {
          print("$oldIndex $newIndex");
        });
  }
}
