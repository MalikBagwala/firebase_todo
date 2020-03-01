import 'package:firebase_todo/main.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "../tasks/task.widget.dart";

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TodoState().getTodos(),
      builder: (context, data) {
        if (!data.hasData) {
          return Text("Loading");
        }

        return ReorderableListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            for (var task in data.data)
              Task(
                id: task['id'],
                key: Key(task['id']),
                title: task['title'],
                isChecked: task['isCompleted'],
              ),
          ],
          onReorder: (oldIndex, newIndex) {
            Provider.of<TodoState>(context, listen: false)
                .reorderTasks(oldIndex, newIndex);
          },
        );
      },
    );
  }
}
